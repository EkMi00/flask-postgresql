SELECT p.*, a.*
FROM PetOwner po, Pet p,
CareTaker ct, Availability a, Bid b
WHERE p.uname = po.uname
AND a.uname = ct.uname
AND b.pouname = p.uname
AND b.name = p.name
AND b.ctuname = a.uname
AND b.s_date = a.s_date
AND b.s_time = a.s_time
AND b.e_time = a.e_time


