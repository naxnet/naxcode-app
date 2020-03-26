import os
import sys
import glob
import requests


def main():
    url_result = sys.argv[1]
    url_result_zip = "/".join(url_result.split("/")[0:-1] + ["result_zip"])
    url_compilation_error = "/".join(url_result.split("/")[0:-1] + ["compilation_error"])



    returned_value = os.system("make compile")
    if returned_value != 0:
        print("error de compilacion")
        files = [
            ('compilation_file', ('compilation.out', open('compilation.out', 'rb'), 'txt'))
        ]
        requests.post(url_compilation_error, files=files)
        return -1

    returned_value = os.system("make all_test")
    if returned_value != 0:

        return -1

    public_test = {}
    for filename in glob.glob("public/diffs/*.diff"):
        exp_name = int(filename.split("/")[2].split('.')[0])
        diff_str = open(filename).readlines()

        public_test[exp_name] = diff_str

    exp_names = list(public_test.keys())
    exp_names.sort()

    public = []
    n_exp_public = len(exp_names)
    n_exp_passed_public = 0

    for i in exp_names:
        exp_passed=False
        if len(public_test[i]) == 0:
            exp_passed = True
            n_exp_passed_public+=1

        public.append({
            "name": i,
            "diff": "".join(public_test[i]),
            "status": exp_passed
        })



    private_test = {}
    for filename in glob.glob("private/diffs/*.diff"):
        exp_name = int(filename.split("/")[2].split('.')[0])
        diff_str = open(filename).readlines()

        private_test[exp_name] = diff_str

    exp_names = list(private_test.keys())
    exp_names.sort()

    private = []
    n_exp_private = len(exp_names)
    n_exp_passed_private = 0

    for i in exp_names:
        exp_passed=False
        if len(private_test[i]) == 0:
            exp_passed = True
            n_exp_passed_private+=1

        private.append({
            "name": i,
            "diff": "".join(private_test[i]),
            "status": exp_passed
        })



    body = {
        "public": {
            "n_exp": n_exp_public,
            "n_passed_exp": n_exp_passed_public,
            "experiments": public
        },
        "private": {
            "n_exp": n_exp_private,
            "n_passed_exp": n_exp_passed_private,
            "experiments": private
        }
    }

    files = [
        ('public_zip', ('public.zip', open('public.zip', 'rb'), 'zip')),
        ('private_zip', ('private.zip', open('private.zip', 'rb'), 'zip')),
    ]

    requests.post(url_result, json=body)
    requests.post(url_result_zip, files=files)


if __name__ == "__main__":
    exit(main())
