!(function (t, e) {
  "object" == typeof exports && "object" == typeof module
    ? (module.exports = e())
    : "function" == typeof define && define.amd
    ? define([], e)
    : "object" == typeof exports
    ? (exports.dayjsPluginUTC = e())
    : (t.dayjsPluginUTC = e());
})(this, function () {
  return (function (t) {
    var e = {};
    function n(o) {
      if (e[o]) return e[o].exports;
      var r = (e[o] = { i: o, l: !1, exports: {} });
      return t[o].call(r.exports, r, r.exports, n), (r.l = !0), r.exports;
    }
    return (
      (n.m = t),
      (n.c = e),
      (n.d = function (t, e, o) {
        n.o(t, e) || Object.defineProperty(t, e, { enumerable: !0, get: o });
      }),
      (n.r = function (t) {
        "undefined" != typeof Symbol &&
          Symbol.toStringTag &&
          Object.defineProperty(t, Symbol.toStringTag, { value: "Module" }),
          Object.defineProperty(t, "__esModule", { value: !0 });
      }),
      (n.t = function (t, e) {
        if ((1 & e && (t = n(t)), 8 & e)) return t;
        if (4 & e && "object" == typeof t && t && t.__esModule) return t;
        var o = Object.create(null);
        if ((n.r(o), Object.defineProperty(o, "default", { enumerable: !0, value: t }), 2 & e && "string" != typeof t))
          for (var r in t)
            n.d(
              o,
              r,
              function (e) {
                return t[e];
              }.bind(null, r)
            );
        return o;
      }),
      (n.n = function (t) {
        var e =
          t && t.__esModule
            ? function () {
                return t.default;
              }
            : function () {
                return t;
              };
        return n.d(e, "a", e), e;
      }),
      (n.o = function (t, e) {
        return Object.prototype.hasOwnProperty.call(t, e);
      }),
      (n.p = ""),
      n((n.s = 0))
    );
  })([
    function (t, e, n) {
      "use strict";
      function o(t) {
        return (o =
          "function" == typeof Symbol && "symbol" == typeof Symbol.iterator
            ? function (t) {
                return typeof t;
              }
            : function (t) {
                return t && "function" == typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype
                  ? "symbol"
                  : typeof t;
              })(t);
      }
      function r(t) {
        var e;
        switch (o(t)) {
          case "string":
            return /Z$/.test(t)
              ? 0
              : (e = /([+-])(\d{2}):?(\d{2})/.exec(t)) && (+e[3] + 60 * e[2]) * ("+" === e[1] ? 1 : -1);
          case "number":
            return Number.isNaN(t) ? null : Math.abs(t) < 16 ? 60 * t : t;
          default:
            return null;
        }
      }
      n.r(e);
      var i = function (t, e, n) {
          var o = String(t);
          return !o || o.length >= e ? t : "".concat(Array(e + 1 - o.length).join(n)).concat(t);
        },
        s = function (t) {
          var e = Math.abs(t),
            n = Math.floor(e / 60),
            o = e % 60;
          return ""
            .concat(t <= 0 ? "+" : "-")
            .concat(i(n, 2, "0"), ":")
            .concat(i(o, 2, "0"));
        };
      function u(t, e) {
        for (var n = 0; n < e.length; n++) {
          var o = e[n];
          (o.enumerable = o.enumerable || !1),
            (o.configurable = !0),
            "value" in o && (o.writable = !0),
            Object.defineProperty(t, o.key, o);
        }
      }
      var f = new Date().getTimezoneOffset(),
        a = Date.prototype;
      function c(t) {
        return 6e4 * (t - (arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : f));
      }
      var l = (function () {
        function t() {
          var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : new Date(),
            n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.getTimezoneOffset();
          !(function (t, e) {
            if (!(t instanceof e)) throw new TypeError("Cannot call a class as a function");
          })(this, t),
            (this.$d = new Date(e.getTime() - c(n))),
            (this.$timezoneOffset = n);
        }
        var e, n, o;
        return (
          (e = t),
          (n = [
            {
              key: "getTimezoneOffset",
              value: function () {
                return this.$timezoneOffset;
              },
            },
            {
              key: "setTimezoneOffset",
              value: function () {
                var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : this.$timezoneOffset;
                this.$d.setTime(this.$d.getTime() + c(this.$timezoneOffset, t)), (this.$timezoneOffset = t);
              },
            },
          ]) && u(e.prototype, n),
          o && u(e, o),
          t
        );
      })();
      [
        "toDateString",
        "toLocaleString",
        "toLocaleDateString",
        "toLocaleTimeString",
        "setDate",
        "setFullYear",
        "setHours",
        "setMilliseconds",
        "setMinutes",
        "setMonth",
        "setSeconds",
        "setTime",
        "setYear",
        "getDate",
        "getDay",
        "getFullYear",
        "getHours",
        "getMilliseconds",
        "getMinutes",
        "getMonth",
        "getSeconds",
        "getYear",
      ].forEach(function (t) {
        l.prototype[t] = function () {
          return a[t].apply(this.$d, arguments);
        };
      }),
        [
          "toISOString",
          "toUTCString",
          "toGMTString",
          "toJSON",
          "getUTCDate",
          "getUTCDay",
          "getUTCFullYear",
          "getUTCHours",
          "getUTCMilliseconds",
          "getUTCMinutes",
          "getUTCMonth",
          "getUTCSeconds",
          "valueOf",
          "getTime",
        ].forEach(function (t) {
          l.prototype[t] = function () {
            return a[t].apply(new Date(this.$d.getTime() + c(this.$timezoneOffset)), arguments);
          };
        }),
        [
          "setUTCDate",
          "setUTCFullYear",
          "setUTCHours",
          "setUTCMilliseconds",
          "setUTCMinutes",
          "setUTCMonth",
          "setUTCSeconds",
        ].forEach(function (t) {
          l.prototype[t] = function () {
            var e = new Date(this.$d.getTime() + c(this.$timezoneOffset));
            a[t].apply(e, arguments), e.setTime(e.getTime() - c(this.$timezoneOffset)), (this.$d = e);
          };
        }),
        ["toString", "toTimeString"].forEach(function (t) {
          l.prototype[t] = function () {
            return a[t].apply(this.$d, arguments).replace(/GMT(.*)$/, "GMT".concat(s(this.$timezoneOffset)));
          };
        });
      var d = l,
        p = !1,
        h = function (t, e) {
          ["clone", "add", "subtract", "startOf"].forEach(function (n) {
            t[n] = function () {
              var t = this.utcOffset();
              return e[n].apply(this, arguments).utcOffset(t);
            };
          }),
            (t.utc = function () {
              return this.utcOffset(0);
            }),
            (t.local = function () {
              return this.utcOffset(-f);
            }),
            (t.utcOffset = function (t) {
              if (void 0 === t) {
                var e = this.$d.getTimezoneOffset();
                return 0 === e ? 0 : -e;
              }
              return null !== r(t) && (this.$d.setTimezoneOffset(-r(t)), this.init()), this;
            }),
            (t.toDate = function () {
              return new Date(this.$d.getTime());
            }),
            (t.isLocal = function () {
              return this.$d.getTimezoneOffset() === f;
            }),
            (t.isUTC = function () {
              return 0 === this.$d.getTimezoneOffset();
            }),
            (t.$set = function () {
              for (var t, n = this.$d.getTimezoneOffset(), o = arguments.length, r = new Array(o), i = 0; i < o; i++)
                r[i] = arguments[i];
              return (
                (t = e.$set).call.apply(t, [this].concat(r)),
                this.$d instanceof Date && (this.$d = new d(this.$d, n)),
                this
              );
            }),
            (t.parse = function (t) {
              e.parse.call(this, t);
              var n = this.$d,
                o = "string" == typeof t.date ? r(t.date) : null;
              (this.$d = new d(n, null === o ? f : -o)), p && this.local(), this.init();
            });
        };
      e.default = function () {
        var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
          e = arguments.length > 1 ? arguments[1] : void 0,
          n = arguments.length > 2 ? arguments[2] : void 0;
        p = !!t.parseToLocal;
        var o = e.prototype,
          i = function () {};
        i.prototype = o;
        var s = new i();
        h(s, o),
          (s.constructor = e.constructor),
          (e.prototype = s),
          (n.utc = function (t) {
            var e = this(t);
            return "string" == typeof t && null === r(t) && (e.$d.$timezoneOffset = 0), e.utc();
          });
      };
    },
  ]);
});
