$c[Настройки]
    $nomention $allowMention
    $var[User;$findUser[$message[1];no]]

$c[Проверки]
    $embedSuppressErrors[Упс, ошибка;;F4B3CA;;Система гильдий $username[$botID];]
    $onlyIf[$var[User]!=;Кажется, пользователь не найден!]
    $onlyIf[$getUserVar[Guild;$authorID]==false;**Ты** уже состоишь в гильдии!]
    $onlyIf[$getUserVar[Guild;$var[User]]==true;**<@$var[User]>** не состоит в какой-либо гильдии!]
    $onlyIf[$getUserVar[GuildOwner;$var[User]]==true;**<@$var[User]>** не является владельцем гильдии!]
    $onlyIf[$getUserVar[GuildPrivate;$var[User]]==false;В данную гильдию можно вступить только по приглашению!]

$color[F4B3CA]
$title[Вступление в гильдию]
$description[
**<@$authorID>** вступил в гильдию $getUserVar[GuildName;$var[User]]!
$if[$getUserVar[FirstGuild;$authorID]==true] Поскольку это его первая выбранная гильдия, гильдия $getUserVar[GuildName;$var[User]] получает 15 репутации! $endif
]
$footer[В этой гильдии теперь $sum[$getUserVar[GuildMembers;$var[User]];1] участников!]

$c[Переменные]
    $setUserVar[Guild;true;$authorID]
    $setUserVar[GuildName;$getUserVar[GuildName;$var[User]];$authorID]
    $setUserVar[GuildOwnerID;$var[User];$authorID]
    $setUserVar[GuildMembers;$sum[$getUserVar[GuildMembers;$var[User]];1];$var[User]]
    $if[$getUserVar[FirstGuild;$authorID]==true]
        $setUserVar[FirstGuild;false;$authorID]
        $setUserVar[GuildReputation;$sum[$getUserVar[GuildReputation;$var[User]];15];$var[User]]
    $endif