$c[Settings]
    $nomention

$c[Checks]
    $embedSuppressErrors[Oops, error;;F4B3CA;;$username[$botID]’s guild system;]
    $onlyIf[$getUserVar[GuildOwner;$authorID]==false;**You** already owned a guild!]
    $onlyIf[$getUserVar[Guild;$authorID]==false;**You** already in a guild!]
    $argsCheck[>1;Must be 1 or more arguments!!]
    $onlyIf[$argCount[$message]<=25;Guild name must be lower or equal 25 characters (you **have** $argCount[$message], include spaces)!]

$color[F4B3CA]
$title[Guild created]
$description[
**Name**: $message
**Owner**: <@$authorID>
**Description**: `(set up it using !settings)`
]

$c[Variables]
    $setUserVar[Guild;true;$authorID]
    $setUserVar[GuildOwner;true;$authorID]
    $setUserVar[GuildOwnerID;$authorID;$authorID]
    $setUserVar[GuildName;$message;$authorID]
    $setUserVar[GuildMembers;1;$authorID]