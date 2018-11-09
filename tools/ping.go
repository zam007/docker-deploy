package main
import (
	"flag"
	"fmt"
	"net"
	"os"
  "encoding/hex"
  "strings"
  "crypto/tls"
)
var host = flag.String("host", "dev.grouk.com", "host")
var port = flag.String("port", "8081", "port")
var usessl bool

var pingHex = "0100000000020809"
var pongHex = "010000000002080a"
func main() {
  flag.BoolVar(&usessl,"ssl",false,"ssl")
	flag.Parse()
  var conn net.Conn
  var err error
  if(usessl){
    conn, err = tls.Dial("tcp", *host+":"+*port, nil)
  }else{
    conn, err = net.Dial("tcp", *host+":"+*port)
  }

	if err != nil {
		fmt.Println("Error connecting:", err)
		os.Exit(1)
	}
	defer conn.Close()
	fmt.Println("Connecting to ", *host, ":", *port, "ssl:", usessl)

  b, err := hex.DecodeString(pingHex)

  if err != nil {
      fmt.Println(err)
      os.Exit(1)
  }
  _, e := conn.Write(b)
  if e != nil {
    fmt.Println("Error to send message because of ", e.Error())
    os.Exit(1)
  }
  buf := make([]byte, 32)
	reqLen, err := conn.Read(buf)
	if err != nil {
		fmt.Println("Error to read message because of ", err)
		return
	}
  result := hex.EncodeToString(buf[:reqLen]);
	fmt.Println("pong:" + result)
  if(!strings.EqualFold(pongHex,result)){
    fmt.Println("invalid result")
    os.Exit(1)
  }
}
