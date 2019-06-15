Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B85471AE
	for <lists+linux-audit@lfdr.de>; Sat, 15 Jun 2019 20:29:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7FEF5307D84B;
	Sat, 15 Jun 2019 18:29:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2CB65DE4E;
	Sat, 15 Jun 2019 18:29:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B23E21806B19;
	Sat, 15 Jun 2019 18:28:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5FIS9EF000492 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 15 Jun 2019 14:28:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 41D285DE4E; Sat, 15 Jun 2019 18:28:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-120-206.rdu2.redhat.com [10.10.120.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCF0E73D5C;
	Sat, 15 Jun 2019 18:28:06 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Tarun Ramesh <tramesh@acalvio.com>
Subject: Re: auparse_feed callback on EOE record
Date: Sat, 15 Jun 2019 14:28:05 -0400
Message-ID: <8592444.xLyGizrlS5@x2>
Organization: Red Hat
In-Reply-To: <CAFQMB-UhU-4-uYVcasZn+E-GonpqqPO_7UZojSZ-7-2Eo81KZQ@mail.gmail.com>
References: <CAFQMB-USapCi=pV8ZNkNwTAYZ0FuVKaMKKQvK4y19RUmL90zhA@mail.gmail.com>
	<4766346.QBaMZih7XG@x2>
	<CAFQMB-UhU-4-uYVcasZn+E-GonpqqPO_7UZojSZ-7-2Eo81KZQ@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Sat, 15 Jun 2019 18:29:14 +0000 (UTC)

Hello,

On Wednesday, June 12, 2019 3:05:40 AM EDT Tarun Ramesh wrote:
> Also I noticed that the EOE record is treated as its own event even though
> there were other records with the same audit serial number. I guess this is
> expected as after EOE there will be no more records for this event and if
> EOE was treated as a part of the previous event, then it will not be
> possible to tell when this event is complete.

This turns out to be a benign bug. Auparse has some heuristics to determine 
the end of an event as quickly as possible. It appears that it determined the 
event was complete before the EOE event arrived and thus the EOE event had no 
existing event to get added to. I fixed auparse to eat standalone EOE events 
since they are meaningless on their own. Thanks for reporting this issue.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
