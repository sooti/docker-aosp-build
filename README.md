Docker Ubuntu Image to build AOSP source code
====

Support API 4 (android-1.6_r1.2), API 23 (android-6.0.1_r77), API 28 (android-9.0.0_r1).

Download the source code, go into the root folder of project. Use the docker image as:

```shell
docker pull camelcc/aosp-build:28
docker run -it --rm -v "$PWD":/build -w /build camelcc/aosp-build:28
```

After this, it will open a bash shell and following whatever steps google documented.


## Ref

http://owen-hsu.blogspot.com/2010/10/tips-some-problems-you-may-meet-when.html  
http://www.android5.online/Android/androidjc/gyandroid/201702/60716.html  
https://ubuntuforums.org/archive/index.php/t-1748408.html  
http://lifeonubuntu.com/ubuntu-missing-add-apt-repository-command/  
https://hub.docker.com/r/igorsh/ubuntu10.04-android/~/dockerfile/  
http://android-rebuilds.beuc.net/SDK_6.0.0/  