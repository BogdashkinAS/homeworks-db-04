select g.name, count(a.name_author) from genre g
left join genre_author ga on g.id = ga.genre_id
left join author as a on ga.author_id = a.id
group by g.name
order by count(a.id) DESC;

select t.name_track, a.year from album as a
left join track as t on t.album_id = a.id
where (a.year >= 2019) and (a.year <= 2020);

select a.name_album, AVG(t.duration) from album as a
left join track as t on t.album_id = a.id
group by a.name_album
order by AVG(t.duration);

select a.name_author from author as a
where a.name_author not in (
select a.name_author from author as a
left join author_album as aa on a.id = aa.author_id
left join album as al on al.id = aa.album_id
where al.year = 2020)
order by a.name_author;

select c.name from compilation as c
left join compilation_track as ct on c.id = ct.compilation_id
left join track as t on t.id = ct.track_id
left join album as a on a.id = t.album_id
left join author_album as aa on aa.album_id = a.id
left join author as au on au.id = aa.author_id
where au.name_author like '%%Massive Attack%%'
order by c.name;

select a.name_album from album as a
left join author_album as aa on a.id = aa.album_id
left join author as au on au.id = aa.author_id 
left join genre_author ga on au.id = ga.author_id
left join genre as g on g.id = ga.genre_id 
group by a.name_album
having count(distinct g.name) > 1
order by a.name_album;

select t.name_track from track as t
left join compilation_track as ct on t.id = ct.track_id
where ct.compilation_id is null;

select a.name_author, t.duration from track as t
left join album as al on al.id = t.album_id
left join author_album as aa on aa.album_id = al.id
left join author as a on a.id = aa.album_id
group by a.name_author, t.duration
having t.duration = (select min(duration) from track)
order by a.name_author;

select a.name_album from album as a
left join track as t on t.album_id = a.id
where t.album_id in (
select album_id from track
group by album_id
having count(id) = (select count(id) from track
group by album_id
order by count
limit 1))
order by a.name_album;
