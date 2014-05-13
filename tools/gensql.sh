awk 'BEGIN{f=0;z="'\''";}
{
    if($0=="<doc>"){
        f=1;
    };
    if($0=="</doc>"){
        f=2;
    };
    if(f==1){
        if(substr($0,2,3)=="url")
        {url=substr($0,6,length($0)-11)}
        if(substr($0,2,5)=="docno")
        {docno=substr($0,8,length($0)-15)}
        if(substr($0,2,12)=="contenttitle")
        {contenttitle=substr($0,15,length($0)-29)}
        if(substr($0,2,7)=="content")
        {content=substr($0,10,length($0)-19)}

    };
    if(f==2){
    print "insert into news (url,docno,contenttitle,content)values("z url z","z docno z","z contenttitle z","z content z");";
    f=0;
    };


}END{}' $1
