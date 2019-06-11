Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4223D216
	for <lists+linux-audit@lfdr.de>; Tue, 11 Jun 2019 18:22:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78164C1EB1EF;
	Tue, 11 Jun 2019 16:21:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC61B4647B;
	Tue, 11 Jun 2019 16:20:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F5DF18363C1;
	Tue, 11 Jun 2019 16:20:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5BGJAvm018734 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 12:19:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3D6A60BF1; Tue, 11 Jun 2019 16:19:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-122-32.rdu2.redhat.com [10.10.122.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9972160BF4;
	Tue, 11 Jun 2019 16:19:07 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: auparse_feed callback on EOE record
Date: Tue, 11 Jun 2019 12:19:05 -0400
Message-ID: <4766346.QBaMZih7XG@x2>
Organization: Red Hat
In-Reply-To: <CAFQMB-USapCi=pV8ZNkNwTAYZ0FuVKaMKKQvK4y19RUmL90zhA@mail.gmail.com>
References: <CAFQMB-USapCi=pV8ZNkNwTAYZ0FuVKaMKKQvK4y19RUmL90zhA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Tarun Ramesh <tramesh@acalvio.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 11 Jun 2019 16:21:56 +0000 (UTC)

On Tuesday, June 11, 2019 2:56:23 AM EDT Tarun Ramesh wrote:
> The callback function on_audit_event() just goes through the records one by
> one and prints the fields and values. I have added a rule to watch for
> file edits in the /home folder. I see the records for file creation in
> this folder being received, however it looks like the callback function is
> not being called when an EOE record is received. Please let me know if I'm
> missing something.

As long as the format exactly matched how auditd creates the record, cursory 
glance appears ok, then the records get grouped inside auparse to form a 
complete event. When the event is determined to be complete, it is passed to 
the registered callback function. You need to iterate over the individual 
records to see the whole event. 

So, you do not get a callback on an individual record, you are called back on 
a complete event. The EOE record should be the last record. You can use 
auparse_next_record() to iterate across records.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
