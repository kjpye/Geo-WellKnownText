[![Actions Status](https://github.com/kjpye/Geo-WellKnownText/actions/workflows/test.yml/badge.svg)](https://github.com/kjpye/Geo-WellKnownText/actions)

TITLE
=====

Geom::WellKnownText

The `Geo::WellKnownText` module contains a single function:

from-wkt
========

`from-wkt` takes a single `Str` parameter, and returns a single `Geo::Geometry` object corresponding to the wkt specification, or a `Failure` if the contents of the string cannot be interpreted as a Geometry object.

The conversion is case-insensitive, and optional whitespace may be included in various places. Thus the following strings will all produce the same object:

        PointZ(123 456 789)
        Point Z (123 456 789)
        Point Z(123 456 789)
        pointz (123 456 789)

Geo::WellKnownText::Grammar
===========================

The `Geo::WellKnownText::Grammar` module contains a single grammar `Geo::WellKnownText::Grammar::WKT`.

This is the same grammar used by the `Geo::WellKnownText` module, but it can be used separately to parse WKT strings.

The general usage would be

        my $results = Geo::WellKnownText::Grammar::WKT.parse($string, actions => My::Actions);

The actions used by `Geo::WellKnownText::from-wkt` are available in `Geo::WellKnownText::WKT-Actions`, but in that case you might as well use `from-wkt` described above.

The actions class will need to include the following methods (36 in total):

<table class="pod-table">
<thead><tr>
<th>Geometry type</th> <th>Method</th> <th>Available Parameters</th>
</tr></thead>
<tbody>
<tr> <td>Point[Z][M]</td> <td>point[z][m]</td> <td>$&lt;value&gt; — an array containing the values for x, y, z and m as appropriate</td> </tr> <tr> <td>LineString[Z][M]</td> <td>linestring[z][m]-text</td> <td>$&lt;point[z][m]&gt; — an array of whatever the relevant point method passed to make.</td> </tr> <tr> <td>LinearRing[Z][M]</td> <td>linearring[z][m]-text</td> <td>$&lt;point[z][m]&gt; — and array of whatever the relevant point method passed to make.</td> </tr> <tr> <td>Polygon[Z][M]</td> <td>polygon[z][m]-text</td> <td>$&lt;linearring[z][m]-text — an array of whatever the appropriate linearring-text method passed to make.</td> </tr> <tr> <td>PolyhedralSurface[Z][M]</td> <td>polyhedralsurface[z][m]-text</td> <td>$&lt;polygon[z][m]-text — an array of whatever the appropriate polygon-text method passed to make.</td> </tr> <tr> <td>MultiPoint[Z][M]</td> <td>multipoint[z][m]-text</td> <td>$&lt;point[z][m]&gt; — an array of whatever the relevant point method passed to make.</td> </tr> <tr> <td>MultiLineString[Z][M]</td> <td>multilinestring[z][m]-text</td> <td>$&lt;linestring[z][m]-text&gt; — an array of whatever the relevant linestring-text method passed to make.</td> </tr> <tr> <td>MultiPolygon[Z][M]</td> <td>multipolygon[z][m]-text</td> <td>$&lt;polygon[z][m]-text — an array of whatever the appropriate polygon-text method passed to make.</td> </tr> <tr> <td>GeometryCollection[Z][M]</td> <td>geometrycollection[z][m]-tagged-text</td> <td>$&lt;geometry[z][m]-tagged-text&gt; — an array of whatever the relevant geometry-text method passed to make.</td> </tr>
</tbody>
</table>

