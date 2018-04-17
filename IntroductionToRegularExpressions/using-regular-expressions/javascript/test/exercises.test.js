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

    function mysteryMath(str) {
        return str.replace(/[+*\-\/]/, "?");
    }

    function mysteriousMath(str) {
        return str.replace(/[+*\-\/]/g, "?");
    }

    function danish(str) {
        return str.replace(/\b(apple|blueberry|cherry)\b/, "danish");
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

    it('testing mysteryMath', function () {
        var expressions = [
            '4 + 3 - 5 = 2',
            '4 - 3 - 5 = -4',
            '4 * 3 - 5 = 7',
            '4 / 2 - 5 = -3',
            '(4 * 3 + 2) / 7 - 1 = 1'
        ];
        var expected = [
            '4 ? 3 - 5 = 2',
            '4 ? 3 - 5 = -4',
            '4 ? 3 - 5 = 7',
            '4 ? 2 - 5 = -3',
            '(4 ? 3 + 2) / 7 - 1 = 1'
        ];
        expect(expected).to.deep.equal(expressions.map(mysteryMath));
    });

    it('testing mysteriousMath', function () {
        var expressions = [
            '4 + 3 - 5 = 2',
            '(4 * 3 + 2) / 7 - 1 = 1'
        ];
        var expected = [
            '4 ? 3 ? 5 = 2',
            '(4 ? 3 ? 2) ? 7 ? 1 = 1'
        ];
        expect(expected).to.deep.equal(expressions.map(mysteriousMath));
    });

    it('testing danish', function () {
        var strs = [
            'An apple a day keeps the doctor away',
            'My favorite is blueberry pie',
            'The cherry of my eye',
            'apple. cherry. blueberry.',
            'I love pineapple'
        ];
        var expected = [
            'An danish a day keeps the doctor away',
            'My favorite is danish pie',
            'The danish of my eye',
            'danish. cherry. blueberry.',
            'I love pineapple'
        ];
        expect(expected).to.deep.equal(strs.map(danish));
    });
    
});