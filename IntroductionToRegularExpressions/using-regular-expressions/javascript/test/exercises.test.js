"use strict";

var expect = require('chai').expect;

describe('Exercises for Using Regular Expressions Chapter in Introduction To Regular Expressions', function () {

    function isURL(str) {
        var regex = /^https?:\/\/\S+$/;
        return regex.test(str);
    }

    it('testing URLs', function () {
        var urls = ['http://launchschool.com', 'https://example.com',
            'https://example.com hello', '   https://example.com'];
        var results = urls.map(isURL);
        var expected = [true, true, false, false]
        expect(expected).to.deep.equal(results);
    });
    
});