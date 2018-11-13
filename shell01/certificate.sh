#!/bin/bash
 echo "+++++++++++++++++++++++++++++++++++++++++"
 echo "+					+"
 echo "+					+"
 echo "+      欢迎来到开源许可证查询系统	+"
 echo "+					+"
 echo "+					+"
 echo "+++++++++++++++++++++++++++++++++++++++++"
 echo "    "
 echo "    "
while true;do
  echo -e "他人修改源码后，是否可以闭源？[Y/N]:  \c"
  read Cond1

  if [ $Cond1 = 'Y' ];then 
   echo -e "每一个修改过的文件，是否都必须放置版权说明？[Y/N]:  \c"
   read Cond2

     if [ $Cond2 = 'Y' ];then
        echo "您应该选择：Apache许可证"
   
     elif [ $Cond2 = 'N' ];then
          echo -e "衍生软件的广告，是否可以用你的名字促销？[Y/N]:  \c"
          read Cond3

        if [ $Cond3 = 'Y' ];then
            echo "您应该选择：MIT许可证"
          
        elif [ $Cond3 = 'N' ];then
            echo "您应该选择：BSD许可证" 
   
        else 
            echo "Error input"
        fi
     
     else 
        echo "Error input"
 
     fi



  elif [ $Cond1 = 'N' ];then
    echo -e "新增代码是否采用同样许可证？[Y/N]:  \c"
    read Cond4
    if [ $Cond4 = 'Y' ];then
        echo "您应该选择：GPL许可证"
      
    elif [ $Cond4 = 'N' ];then
        echo -e "是否需要对源码的修改之处，提供说明文档？[Y/N]:  \c"
        read Cond5
        if [ $Cond5 = 'Y' ];then
            echo "您应该选择：Mozilla许可证"
        elif [ $Cond5 = 'N' ];then
             echo "您应该选择：LGPL许可证"

        else
            echo "Error input"
         
        fi
       
     fi
  elif [ $Cond1 = "exit"];then
      break
  else 
    echo "Error input"
   
  fi
done
