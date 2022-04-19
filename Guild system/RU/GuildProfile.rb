$c[Настройки]
    $nomention $allowMention
    $var[User;$findUser[$message[1];yes]]

$c[Проверки]
    $embedSuppressErrors[Упс, ошибка;;F4B3CA;;Система гильдий $username[$botID];]
    $onlyIf[$var[User]!=;Кажется, пользователь не найден!]
    $onlyIf[$getUserVar[Guild;$var[User]]==true;$if[$var[User]==$authorID] **Ты** не состоишь в гильдии! $else **<@$var[User]>** не состоит в гильдии! $endif]

$color[F4B3CA]
$thumbnail[$userAvatar[$getUserVar[GuildOwnerID;$var[User]]]]
$title[Гильдия $getUserVar[GuildName;$var[User]]]
$description[
**Владелец**: <@$getUserVar[GuildOwnerID;$var[User]]>
**Тип**: $replaceText[$replaceText[$getUserVar[GuildPrivate;$var[User]];false;публичная;-1];true;приватная;-1]
**Репутация**: $numberSeparator[$getUserVar[GuildReputation;$getUserVar[GuildOwnerID;$var[User]]]]
**Участники**: $numberSeparator[$getUserVar[GuildMembers;$getUserVar[GuildOwnerID;$var[User]]]]
**Описание**: $if[$getUserVar[GuildDescription;$var[User]]==false] Не установлено $else $getUserVar[GuildDescription;$var[User]] $endif
]
