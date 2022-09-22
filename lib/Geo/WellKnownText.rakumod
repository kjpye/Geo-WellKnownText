use Geo::Geometry;
use Geo::WellKnownText::Grammar;

class WKT-Actions {

# Point
    method point($/) {
        make Point.new(x => $<value>[0].made.Num,
                       y => $<value>[1].made.Num
                      );
    }
    method pointz($/) {
        make PointZ.new(x => $<value>[0].made.Num,
                        y => $<value>[1].made.Num,
                        z => $<value>[2].made.Num
                       );
    }
    method pointm($/) {
        make PointM.new(x => $<value>[0].made.Num,
                        y => $<value>[1].made.Num,
                        m => $<value>[2].made.Num
                       );
    }
    method pointzm($/) {
        make PointZM.new(x => $<value>[0].made.Num,
                         y => $<value>[1].made.Num,
                         z => $<value>[2].made.Num,
                         m => $<value>[3].made.Num
                        );
    }

# LineString
    method linestring-text($/) {
        make LineString.new(points => $<point>.map({.made}));
    }
    method linestringz-text($/) {
        make LineStringZ.new(points => $<pointz>.map({.made}));
    }
    method linestringm-text($/) {
        make LineStringM.new(points => $<pointm>.map({.made}));
    }
    method linestringzm-text($/) {
        make LineStringZM.new(points => $<pointzm>.map({.made}));
    }

# LinearRing
    method linearring-text($/) {
        make LinearRing.new(points => $<point>.map({.made}));
    }
    method linearringz-text($/) {
        make LinearRingZ.new(points => $<pointz>.map({.made}));
    }
    method linearringm-text($/) {
        make LinearRingM.new(points => $<pointm>.map({.made}));
    }
    method linearringzm-text($/) {
        make LinearRingZM.new(points => $<pointzm>.map({.made}));
    }

# Polygon
    method polygon-text($/) {
        make Polygon.new(rings => $<linearring-text>.map({.made}));
    }
    method polygonz-text($/) {
        make PolygonZ.new(rings => $<linearringz-text>.map({.made}));
    }
    method polygonm-text($/) {
        make PolygonM.new(rings => $<linearringm-text>.map({.made}));
    }
    method polygonzm-text($/) {
        make PolygonZM.new(rings => $<linearringzm-text>.map({.made}));
    }

# PolyhedralSurface
    method polyhedralsurface-text($/) {
        make PolyhedralSurface.new(polygons => $<polygon-text>.map({.made}));
    }
    method polyhedralsurfacez-text($/) {
        make PolyhedralSurfaceZ.new(polygons => $<polygonz-text>.map({.made}));
    }
    method polyhedralsurfacem-text($/) {
        make PolyhedralSurfaceM.new(polygons => $<polygonm-text>.map({.made}));
    }
    method polyhedralsurfacezm-text($/) {
        make PolyhedralSurfaceZM.new(polygons => $<polygonzm-text>.map({.made}));
    }

# MultiPoint
    method multipoint-text($/) {
        make MultiPoint.new(points => $<point-text>.map({.made}));
    }
    method multipointz-text($/) {
        make MultiPointZ.new(points => $<pointz-text>.map({.made}));
    }
    method multipointm-text($/) {
        make MultiPointM.new(points => $<pointm-text>.map({.made}));
    }
    method multipointzm-text($/) {
        make MultiPointZM.new(points => $<pointzm-text>.map({.made}));
    }

# MultiLineString
    method multilinestring-text($/) {
        make MultiLineString.new(linestrings => $<linestring-text>.map({.made}));
    }
    method multilinestringz-text($/) {
        make MultiLineStringZ.new(linestrings => $<linestringz-text>.map({.made}));
    }
    method multilinestringm-text($/) {
        make MultiLineStringM.new(linestrings => $<linestringm-text>.map({.made}));
    }
    method multilinestringzm-text($/) {
        make MultiLineStringZM.new(linestrings => $<linestringzm-text>.map({.made}));
    }

# MultiPolygon    
    method multipolygon-text($/) {
        make MultiPolygon.new(polygons => $<polygon-text>.map({.made}));
    }
    method multipolygonz-text($/) {
        make MultiPolygonZ.new(polygons => $<polygonz-text>.map({.made}));
    }
    method multipolygonm-text($/) {
        make MultiPolygonM.new(polygons => $<polygonm-text>.map({.made}));
    }
    method multipolygonzm-text($/) {
        make MultiPolygonZM.new(polygons => $<polygonzm-text>.map({.made}));
    }

# GeometryCollection
    method geometrycollection-text($/) {
        make GeometryCollection.new(geometries => $<geometry-tagged-text>.map({.made}));
    }
    method geometrycollectionz-text($/) {
        make GeometryCollectionZ.new(geometries => $<geometryz-tagged-text>.map({.made}));
    }
    method geometrycollectionm-text($/) {
        make GeometryCollectionM.new(geometries => $<geometrym-tagged-text>.map({.made}));
    }
    method geometrycollectionzm-text($/) {
        make GeometryCollectionZM.new(geometries => $<geometryzm-tagged-text>.map({.made}));
    }
}

our sub from-wkt(Str $s) is export {
    WKT.parse($s, actions => WKT-Actions).made;
}
