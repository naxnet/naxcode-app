if [ "$#" -eq 0 ]; then
  myArray=( )
else
  urls=( $1 )
  names=( $2 )
  src=$3
fi


for ((i=0;i<${#urls[@]};++i)); do
    name=$(echo ${names[i]} | sed 's/"//g')
    url=$(echo ${urls[i]} | sed 's/"//g')
    wget -O ${src}/${name} ${url}
done
