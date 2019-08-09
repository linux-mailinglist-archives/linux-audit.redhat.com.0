Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EC86587C8B
	for <lists+linux-audit@lfdr.de>; Fri,  9 Aug 2019 16:20:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E0D051F1C;
	Fri,  9 Aug 2019 14:20:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 949BB5C21A;
	Fri,  9 Aug 2019 14:20:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 341432551C;
	Fri,  9 Aug 2019 14:20:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79EIYAZ030707 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 10:18:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10357100034E; Fri,  9 Aug 2019 14:18:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (unknown [10.43.17.81])
	by smtp.corp.redhat.com (Postfix) with SMTP id 952061000182;
	Fri,  9 Aug 2019 14:18:32 +0000 (UTC)
Date: Fri, 9 Aug 2019 16:18:31 +0200
From: Jiri Olsa <jolsa@redhat.com>
To: linux-audit@redhat.com
Subject: [RFC] audit support for BPF notification
Message-ID: <20190809141831.GB9377@krava>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 09 Aug 2019 10:20:30 -0400
Cc: Stanislav Kozina <skozina@redhat.com>,
	Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	Jiri Benc <jbenc@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Fri, 09 Aug 2019 14:20:48 +0000 (UTC)

hi,
I posted initial change that allows auditd to log BPF program
load/unload events, it's in here:
  https://github.com/linux-audit/audit-userspace/pull/104

We tried to push pure AUDIT interface for BPF program notification,
but it was denied, the discussion is in here:
  https://marc.info/?t=153866123200003&r=1&w=2

The outcome of the discussion was to use perf event interface
for BPF notification and use it in some deamon.. audit was our
first choice.

thoughts?

thanks,
jirka

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
