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

1. Get the <a href="refreshGitToken.sh" download>refreshGitToken.sh</a> script 
2. chmod +x refreshGitToken.sh
3. `sh refreshGitoken.sh {yourNewToken} {absolutePathOfYourProject}`
4. Press "Enter" and follow the intructions.

## Demo

![Alt text](img/refreshGitToken.png "Capture")