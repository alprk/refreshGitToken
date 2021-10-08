# refreshGitToken

>[GitHub] Your personal access token is about to expire

I think every developpers knows that email...
And an update of all your projects using that token will be necessary.

#### This little script will make your job easier :)

## Notice
This script assume that you already have set a personnal acces token in your `/my/project/.git/config` file like following :

```
[remote "origin"]
        url = https://myUser:myToken@github.com/Organisation/project.git
```

## Steps

Optionnal : You can visualize [refreshGitToken.sh](refreshGitToken.sh) script 

1. Get [RefreshGitToken.sh](https://github.com/alprk/refreshGitToken/releases/download/1.0.0/refreshGitToken.sh)
2. Allow execution `chmod +x refreshGitToken.sh`
3. Call the script with 2 arguments :

- Argument one `theNewToken`
- Argument two `the/absolute/path/of/your/project`

- Ex : `sh refreshGitoken.sh theNewToken the/absolute/path/of/your/project`
4. Press "Enter" and follow the intructions.

## Demo

![Alt text](img/refreshGitToken.png "Capture")