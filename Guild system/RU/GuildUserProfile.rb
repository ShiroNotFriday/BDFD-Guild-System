$c[Настройки]
    $nomention $allowMention
    $var[User;$findUser[$message[1];yes]]

$color[F4B3CA]
$title[$if[$var[User]==$authorID] Твой профиль $else Профиль $username[$var[User]] $endif]
$description[
**Имя**: $username[$var[User]]
**Никнейм**: $nickname[$var[User]]
**Тег**: #$discriminator[$var[User]]

**Гильдия**: $if[$getUserVar[Guild;$var[User]]==true] есть $else нету $endif
$if[$getUserVar[Guild;$var[User]]==true]
**Название**: $getUserVar[GuildName;$var[User]]
**Владелец**: $if[$getUserVar[GuildOwner;$var[User]]==true] да $else нет (<@$getUserVar[GuildOwnerID;$var[User]]>) $endif
**Тип**: $replaceText[$replaceText[$getUserVar[GuildPrivate;$getUserVar[GuildOwnerID;$var[User]]];false;публичная;-1];true;приватная;-1]
**Репутация**: $numberSeparator[$getUserVar[GuildReputation;$getUserVar[GuildOwnerID;$var[User]]]]
$endif
]