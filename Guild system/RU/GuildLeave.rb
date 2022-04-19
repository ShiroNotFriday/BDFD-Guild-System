$c[Настройки]
    $nomention

$c[Проверки]
    $embedSuppressErrors[Упс, ошибка;;F4B3CA;;Система гильдий $username[$botID];]
    $onlyIf[$getUserVar[Guild;$authorID]==true;**Ты** не состоишь в какой-либо гильдии!]
    $onlyIf[$getUserVar[GuildOwner;$authorID]==false;Владелец гильдии не может сам же выйти из её!]

$color[F4B3CA]
$title[Выход из гильдии]
$description[
**<@$authorID>** вышел из гильдии $getUserVar[GuildName;$authorID]!
]
$footer[В этой гильдии осталось $sub[$getUserVar[GuildMembers;$getUserVar[GuildOwnerID;$authorID]];1] участников..]

$c[Переменные]
    $setUserVar[Guild;false;$authorID]
    $setUserVar[GuildName;false;$authorID]
    $setUserVar[GuildMembers;$sub[$getUserVar[GuildMembers;$getUserVar[GuildOwnerID;$authorID]];1];$getUserVar[GuildOwnerID;$authorID]]
    $setUserVar[GuildOwnerID;0;$authorID]