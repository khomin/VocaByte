#ifndef NAT_CONVERTER_H_
#define NAT_CONVERTER_H_

#include <string>
#include <cstdio>
#include <cassert>
#include <string.h>

class NativeLibConverter
{
public:
    static std::string chars2jstr(const char *string) {
        if(!string) {
            return ("");
        }

        int l=strlen(string);
        char* str = new char[l+1];
        strcpy(str,string);

        unsigned char * bytes = (unsigned char *)str;
        int n;
        while(*bytes)
        {
            if( (// ASCII
                    // use bytes[0] <= 0x7F to allow ASCII control characters
                    bytes[0] == 0x07 ||
                    bytes[0] == 0x09 ||
                    bytes[0] == 0x0A ||
                    bytes[0] == 0x0C ||
                    bytes[0] == 0x0D ||
                    (0x20 <= bytes[0] && bytes[0] <= 0x7E)
            )
                    ) {
                n = 0;
            }
            else
            if( (// non-overlong 2-byte
                    (0xC2 <= bytes[0] && bytes[0] <= 0xDF) &&
                    (0x80 <= bytes[1] && bytes[1] <= 0xBF)
            )
                    ) {
                n=1;
            }
            else
            if( (// excluding overlongs
                        bytes[0] == 0xE0 &&
                        (0xA0 <= bytes[1] && bytes[1] <= 0xBF) &&
                        (0x80 <= bytes[2] && bytes[2] <= 0xBF)
                ) ||
                (// straight 3-byte
                        ((0xE1 <= bytes[0] && bytes[0] <= 0xEC) ||
                        bytes[0] == 0xEE ||
                        bytes[0] == 0xEF) &&
                        (0x80 <= bytes[1] && bytes[1] <= 0xBF) &&
                        (0x80 <= bytes[2] && bytes[2] <= 0xBF)
                ) ||
                (// excluding surrogates
                        bytes[0] == 0xED &&
                        (0x80 <= bytes[1] && bytes[1] <= 0x9F) &&
                        (0x80 <= bytes[2] && bytes[2] <= 0xBF)
                )
                    ) {
                n=2;
            }
            else
            if( (// planes 1-3
                        bytes[0] == 0xF0 &&
                        (0x90 <= bytes[1] && bytes[1] <= 0xBF) &&
                        (0x80 <= bytes[2] && bytes[2] <= 0xBF) &&
                        (0x80 <= bytes[3] && bytes[3] <= 0xBF)
                ) ||
                (// planes 4-15
                        (0xF1 <= bytes[0] && bytes[0] <= 0xF3) &&
                        (0x80 <= bytes[1] && bytes[1] <= 0xBF) &&
                        (0x80 <= bytes[2] && bytes[2] <= 0xBF) &&
                        (0x80 <= bytes[3] && bytes[3] <= 0xBF)
                ) ||
                (// plane 16
                        bytes[0] == 0xF4 &&
                        (0x80 <= bytes[1] && bytes[1] <= 0x8F) &&
                        (0x80 <= bytes[2] && bytes[2] <= 0xBF) &&
                        (0x80 <= bytes[3] && bytes[3] <= 0xBF)
                )
                    ) {
                n=3;
            }
            else {
                *bytes = '?';
                bytes ++;
                continue;
            }
            for (int i = 1; i < n; i++) {
                if (((bytes[i] & 0xC0) != 0x80)) {
                    *bytes = '?';
                    bytes++;
                    continue;
                }
            }
            bytes += n+1;
        }
        std::string jStr = str;

        delete[] str;

        return jStr;
    }

    template< typename... Args >
    static std::string format( const char* format, Args... args ) {
       int length = std::snprintf( nullptr, 0, format, args... );
       assert( length >= 0 );

       char* buf = new char[length + 1];
       std::snprintf( buf, length + 1, format, args... );

       std::string str( buf );
       delete[] buf;
       return str;
        return "";
    }
};

#endif // NAT_CONVERTER_H_
