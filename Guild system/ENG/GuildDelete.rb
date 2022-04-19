$c[Settings]
    $nomention

$c[Checks]
    $embedSuppressErrors[Oops, error;;F4B3CA;;$username[$botID]’s guild system;]
    $onlyIf[$getUserVar[GuildOwner;$authorID]==true;Only guild owner can delete a guild!]
    $onlyIf[$getUserVar[GuildMembers;$authorID]==1;**You** can not delete a guild..!]

$color[F4B3CA]
$title[Guild deletion]
$description[**<@$authorID>** decided to delete **$getUserVar[GuildName;$authorID] guild**!]
$addField[Reputation:;$getUserVar[GuildReputation;$authorID];yes]

$c[Variables]
    $setUserVar[Guild;false;$authorID]
    $setUserVar[GuildName;false;$authorID]
    $setUserVar[GuildOwner;false;$authorID]
    $setUserVar[GuildOwnerID;0;$authorID]
    $setUserVar[GuildMembers;0;$authorID]
    $setUserVar[GuildReputation;0;$authorID]
    $setUserVar[GuildDescription;false;$authorID]