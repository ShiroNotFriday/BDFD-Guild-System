$c[Настройки]
    $nomention

$c[Проверки]
    $embedSuppressErrors[Упс, ошибка;;F4B3CA;;Система гильдий $username[$botID];]
    $onlyIf[$getUserVar[GuildOwner;$authorID]==true;Только владелец гильдии в праве её удалить!]
    $onlyIf[$getUserVar[GuildMembers;$authorID]==1;**Ты** не можешь удалить гильдию, пока в ней ещё кто-то состоит!]

$color[F4B3CA]
$title[Удаление гильдии]
$description[**<@$authorID>** решил удалить гильдию **$getUserVar[GuildName;$authorID]**!]
$addField[Репутация:;$getUserVar[GuildReputation;$authorID];yes]

$c[Переменные]
    $setUserVar[Guild;false;$authorID]
    $setUserVar[GuildName;false;$authorID]
    $setUserVar[GuildOwner;false;$authorID]
    $setUserVar[GuildOwnerID;0;$authorID]
    $setUserVar[GuildMembers;0;$authorID]
    $setUserVar[GuildReputation;0;$authorID]
    $setUserVar[GuildDescription;false;$authorID]