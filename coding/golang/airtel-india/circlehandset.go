package main

import (
	"bufio"
	"fmt"
	"github.com/gocql/gocql"
	"os"
)

func main() {

	cluster := gocql.NewCluster("10.2.85.143")
	cluster.Consistency = gocql.Quorum
	session, err := cluster.CreateSession()

	if err != nil {
		fmt.Println(err)
	}
	defer session.Close()

	infile, _ := os.Open(os.Args[1])

	defer infile.Close()

	scanner := bufio.NewScanner(infile)

	for scanner.Scan() {

		called := scanner.Text()

		if len(called) == 12 {

			var handset, htype, circle, hub string

			err := session.Query(`select handset, handsettype, circle, hub from advoice.subscriber_handset_circle where mobile = ?`, called).Consistency(gocql.One).Scan(&handset, &htype, &circle, &hub)

			if err != nil {

				handset, htype = fhandset(called)
				circle, hub = fcircle(called)

				if circle != "NA" && hub != "NA" && handset != "NA" && htype != "NA" {

					err := session.Query(`insert into advoice.subscriber_handset_circle (mobile, handset,handsettype,circle,hub) values (?,?,?,?,?)`, called, handset, htype, circle, hub).Exec()

					if err != nil {

						fmt.Println("failed to insert ", called, " err:", err)

					}

				}

			}

			fmt.Println(called + "," + handset + "," + htype + "," + circle + "," + hub)

		}

	}

}
