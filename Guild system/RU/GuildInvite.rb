$c[Настройки]
    $nomention $allowMention
    $var[User;$findUser[$message[1];no]]

$c[Проверки]
    $embedSuppressErrors[Упс, ошибка;;F4B3CA;;Система гильдий $username[$botID];]
    $onlyIf[$var[User]!=;Кажется, пользователь не найден!]
    $onlyIf[$getUserVar[Guild;$var[User]]==false;**<@$var[User]>** уже состоит в гильдии!]
    $onlyIf[$getUserVar[Guild;$authorID]==true;**Ты** не состоишь в какой-либо гильдии!]
    $onlyIf[$getUserVar[GuildOwner;$authorID]==true;Только владелец гильдии может приглашать пользователей в гильдию!]

$c[Прошу не изменять кулдаун ниже, чем 30 секунд во избежание проблем!]
$cooldown[30s;**Твой** менеджер приглашений занят другим приглашением. Это не займет много времени!]

$color[F4B3CA]
$title[Приглашение в гильдию]
$description[
**<@$var[User]>**, **Ты** был приглашён в гильдию $getUserVar[GuildName;$authorID]!
] <@$var[User]> $c[<- Это не ошибка]
$footer[У тебя есть 30 секунд на ответ]

$newSelectMenu[GuildInvite;1;1;Меню действий]
$addSelectMenuOption[GuildInvite;Принять;yes;Принять приглашение;no;]
$addSelectMenuOption[GuildInvite;Отклонить;no;Отклонить приглашение;no;]

$c[Переменные]
    $setUserVar[GuildInvite;true-$authorID;$var[User]]

$async[Сброс переменной через 30 секунд]
    $replyIn[30s]
        $if[$getUserVar[GuildInvite;$var[User]]==true-$authorID]
            $setUserVar[GuildInvite;false;$var[User]]
        $endif
$endasync