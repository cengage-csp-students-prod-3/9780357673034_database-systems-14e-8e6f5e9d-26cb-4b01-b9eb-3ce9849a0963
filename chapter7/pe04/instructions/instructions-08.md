## Task 7:

In addition, the InstantStay Marketing team wants to create a word cloud from the cities of the houses. They want to learn the number of characters in the longest city:

```mysql
SELECT
    MAX(LENGTH(HouseCity))
FROM
    HOUSE;
```

It returns a single entry for the length of the longest city:

<p align='center'>
<img src='../assets/nOn4wdo0RcG2e2nYvh2a.png' width='95%' alt='City length' />
</p>

<sup>_City length_</sup>
