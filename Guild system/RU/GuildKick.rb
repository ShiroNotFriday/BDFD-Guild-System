$c[Настройки]
    $nomention $allowMention
    $var[User;$findUser[$message[1];no]]

$c[Проверки]
    $embedSuppressErrors[Упс, ошибка;;F4B3CA;;Система гильдий $username[$botID];]
    $onlyIf[$getUserVar[GuildOwner;$authorID]==true;Только владелец гильдии в праве кого-то исключить!]
    $onlyIf[$var[User]!=;Кажется, пользователь не найден!]
    $onlyIf[$getUserVar[Guild;$var[User]]==true;**<@$var[User]>** не состоит ни в какой гильдии!]
    $onlyIf[$getUserVar[GuildOwnerID;$var[User]]==$authorID;**<@$var[User]>** не является членом твоей гильдии!]

<@$var[User]>
$color[F4B3CA]
$title[Исключение из гильдии]
$description[**<@$var[User]>**, **Тебя** решили исключить из гильдии $getUserVar[GuildName;$authorID]!]
$footer[В этой гильдии теперь $sub[$getUserVar[GuildMembers;$authorID];1] участников!]

$c[Переменные]
    $setUserVar[Guild;false;$var[User]]
    $setUserVar[GuildName;false;$var[User]]
    $setUserVar[GuildOwnerID;0;$var[User]]
    $setUserVar[GuildMembers;$sub[$getUserVar[GuildMembers];1];$authorID]