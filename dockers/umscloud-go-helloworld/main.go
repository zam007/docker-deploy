package main

import (
    "fmt"
    "net/http"
    "net"
)

func GetLocalIP() string {
    addrs, err := net.InterfaceAddrs()
    if err != nil {
        return ""
    }
    for _, address := range addrs {
        // check the address type and if it is not a loopback the display it
        if ipnet, ok := address.(*net.IPNet); ok && !ipnet.IP.IsLoopback() {
            if ipnet.IP.To4() != nil {
                return ipnet.IP.String()
            }
        }
    }
    return ""
}

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "%s", GetLocalIP())
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":3000", nil)
}
