$c[Настройки]
    $nomention $allowMention
    $var[User;$findUser[$message[1];no]]
$c[Проверки]
    $embedSuppressErrors[Упс, ошибка;;F4B3CA;;Система гильдий $username[$botID];]
    $onlyIf[$var[User]!=;Кажется, пользователь не найден!]
    $onlyIf[$getUserVar[Guild;$var[User]]==true;**<@$var[User]>** не состоит в какой-либо гильдии!]
    $onlyIf[$getUserVar[GuildOwner;$var[User]]==true;**<@$var[User]>** не является владельцем гильдии!]
    $onlyIf[$getUserVar[GuildOwner;$authorID]==true;Только владелец гильдии может объявить дуэль!]
    $cooldown[2s;Подготавливаясь к дуэли, ты слишком устал, попробуй <t:$sum[$getTimestamp;$getCooldown[normal]]:R>]

$color[F4B3CA]
$title[Дуэль гильдий]
$description[
**$getUserVar[GuildName;$authorID] против $getUserVar[GuildName;$var[User]]**

> Чтобы бой был честным, каждому будет выдано одинаковое снаряжение. Шансы у каждого 50 на 50!
]
$footer[У гильдии $getUserVar[GuildName;$var[User]] есть 30 секунд, чтобы принять дуэль]

$addField[Репутация $getUserVar[GuildName;$authorID];$getUserVar[GuildReputation;$authorID];no]
$addField[Репутация $getUserVar[GuildName;$var[User]];$getUserVar[GuildReputation;$var[User]];no]
$addField[Представитель $getUserVar[GuildName;$authorID];<@$authorID>;no]
$addField[Представитель $getUserVar[GuildName;$var[User]];<@$var[User]>;no]

$newSelectMenu[GuildDuel;1;1;Меню действий]
$addSelectMenuOption[GuildDuel;Сразиться;yes;Пойти на дуэль;no;]
$addSelectMenuOption[GuildDuel;Сбежать;no;Отказаться от дуэли;no;]

$c[Переменные]
    $setUserVar[GuildDuel;true-$authorID;$var[User]]

$async[Сброс переменной через 30 секунд]
    $replyIn[30s]
        $if[$getUserVar[GuildDuel;$var[User]]==true-$authorID]
            $setUserVar[GuildDuel;false;$var[User]]
        $endif
$endasync