"use strict";

var expect = require('chai').expect;

describe('Exercises for Using Regular Expressions Chapter in Introduction To Regular Expressions', function () {

    function isURL(str) {
        var regex = /^https?:\/\/\S+$/;
        return regex.test(str);
    }

    function fields(str) {
        return str.split(/\W+/);
    }

    it('testing URLs', function () {
        var urls = ['http://launchschool.com', 'https://example.com',
            'https://example.com hello', '   https://example.com'];
        var expected = [true, true, false, false]
        expect(expected).to.deep.equal(urls.map(isURL));
    });

    it('testing fields', function () {
        var strs = ["Pete,201,Student", "Pete \t 201    ,  TA",
            "Pete \t 201"];
        var expected = [
            ["Pete", "201", "Student"],
            ["Pete", "201", "TA"],
            ["Pete", "201"]
        ];
        expect(expected).to.deep.equal(strs.map(fields));
    });
    
});