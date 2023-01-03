create table jugadores(
    id_jugadores    number(2)    constraint  jugadores_pk        primary key ,
    nombre          varchar2(30) constraint  jugadores_nn1       not null ,
    apellido_1      varchar2(30) constraint  jugadores_nn2       not null ,
    seleccion       varchar2(30) constraint  jugadores_nn3       not null ,
    dorsal          number(2)    constraint  jugadores_nn4       not null ,
    edad            number(2)    constraint  jugadores_nn5       not null ,
    min_jugados     interval day to second
);
create table seleccion(
    id_seleccion    number(2)    constraint seleccion_pk         primary key ,
    nombre          varchar2(30) constraint seleccion_uk1        unique
                                 constraint seleccion_nn1        not null ,
    patrocinador    varchar2(20) constraint seleccion_nn2        not null ,
    --¡ ganador si /no¡--
    ranking_fifa    number(3)    constraint seleccion_nn4        not null
                                 constraint seleccion_uk         unique ,
    goles_afavor    number(2)    constraint seleccion_nn5        not null ,
    goles_encontra  number(2)    constraint seleccion_nn6        not null,
                                 constraint selecion_fk          foreign key (nombre) references jugadores (seleccion)
);
create table golaveras(
    id_jugadores    number(2)    constraint golaveras_pk        primary key ,
    nºgoles         number(2),
    asistencias     number(2),
                                 constraint golaveras_fk        foreign key (id_jugadores) references  jugadores(id_jugadores)
);
create table partidos(
    id_seleccion1   number(2),
    id_seleccion2   number(2),
    fase            varchar2(50)  constraint  partidos_nn1      not null,
    arbitro         varchar2(50)  constraint  partidos_nn2      not null ,
    estadio         varchar2(20)  constraint  partidos_nn3      not null,
                                  constraint  partidos_pk       primary key (id_seleccion1,id_seleccion2)
);
create table resultados(
    id_seleccion1       number(2),
    id_seleccion2       number(2),
    goles_seleccion1    number(2),
    goles_seleccion2    number(2),
                        constraint  resultados_fk   foreign key (id_seleccion2,id_seleccion1) references partidos(id_seleccion2,id_seleccion1)
);
