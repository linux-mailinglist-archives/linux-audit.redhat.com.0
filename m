Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D49EF2D89B6
	for <lists+linux-audit@lfdr.de>; Sat, 12 Dec 2020 20:30:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-cg-11YZCMSaXTlomdow4mw-1; Sat, 12 Dec 2020 14:30:54 -0500
X-MC-Unique: cg-11YZCMSaXTlomdow4mw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B24F9800D53;
	Sat, 12 Dec 2020 19:30:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AD5A60BFA;
	Sat, 12 Dec 2020 19:30:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51781180954D;
	Sat, 12 Dec 2020 19:30:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BC2B009012356 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 11 Dec 2020 21:11:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B57EF10D18CF; Sat, 12 Dec 2020 02:11:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B146110D18CE
	for <linux-audit@redhat.com>; Sat, 12 Dec 2020 02:10:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BCF5858EEC
	for <linux-audit@redhat.com>; Sat, 12 Dec 2020 02:10:58 +0000 (UTC)
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
	[148.163.143.35]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-596-LOVhz_C3NuqRsQkDWOAYbA-1; Fri, 11 Dec 2020 21:10:56 -0500
X-MC-Unique: LOVhz_C3NuqRsQkDWOAYbA-1
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
	0BC24PFV002339
	for <linux-audit@redhat.com>; Sat, 12 Dec 2020 02:10:55 GMT
Received: from g2t2353.austin.hpe.com (g2t2353.austin.hpe.com [15.233.44.26])
	by mx0b-002e3701.pphosted.com with ESMTP id 35bs4atv9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-audit@redhat.com>; Sat, 12 Dec 2020 02:10:55 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net
	[16.196.225.135])
	by g2t2353.austin.hpe.com (Postfix) with ESMTP id 290D86D
	for <linux-audit@redhat.com>; Sat, 12 Dec 2020 02:10:55 +0000 (UTC)
Received: from hpnsw4260.rose.rdlabs.hpecorp.net
	(hpnsw4260.rose.rdlabs.hpecorp.net [15.116.49.55])
	by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id E936236;
	Sat, 12 Dec 2020 02:10:54 +0000 (UTC)
From: =?UTF-8?q?Javier=20Ti=C3=A1?= <javier.tia@hpe.com>
To: linux-audit@redhat.com
Subject: [PATCH] Fix audispd crash on ARM 32-Bits
Date: Fri, 11 Dec 2020 18:10:50 -0800
Message-Id: <20201212021050.26656-1-javier.tia@hpe.com>
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
	definitions=2020-12-11_10:2020-12-11,
	2020-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxlogscore=725 spamscore=0
	bulkscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
	impostorscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2012120014
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sat, 12 Dec 2020 14:30:17 -0500
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On ARM 32-Bits, audispd is crashing. Backtrace:

(gdb) bt
0  0xb6e20958 in __GI_raise (sig=sig@entry=6)
   at /usr/src/debug/glibc/2.23-r0/git/sysdeps/unix/sysv/linux/raise.c:54
1  0xb6e21e58 in __GI_abort ()
   at /usr/src/debug/glibc/2.23-r0/git/stdlib/abort.c:118
2  0xb6e59d64 in __libc_message (do_abort=do_abort@entry=2,
   fmt=0xb6f1119c "*** Error in `%s': %s: 0x%s ***\n")
   at /usr/src/debug/glibc/2.23-r0/git/sysdeps/posix/libc_fatal.c:175
3  0xb6e60108 in malloc_printerr (action=<optimized out>,
   str=0xb6f11354 "double free or corruption (fasttop)", ptr=<optimized out>,
   ar_ptr=<optimized out>)
   at /usr/src/debug/glibc/2.23-r0/git/malloc/malloc.c:5007
4  0xb6e60a98 in _int_free (av=0xb6f2d79c <main_arena>, p=<optimized out>,
   have_lock=<optimized out>)
   at /usr/src/debug/glibc/2.23-r0/git/malloc/malloc.c:3868
5  0x004234b8 in free_pconfig (config=0x43b398)
   at /usr/src/debug/audit/2.4.3-r8/audit-2.4.3/audisp/audispd-pconfig.c:513
6  0x00421244 in main (argc=<optimized out>, argv=<optimized out>)
   at /usr/src/debug/audit/2.4.3-r8/audit-2.4.3/audisp/audispd.c:464

(gdb) f 5
(gdb) p config->path
$2 = 0x43b5f0 ""
(gdb) p config->name
$3 = 0x43b370 "h\264C

Be paranoid and overwrite config->path with zero bytes before doing the
free().
---
 audisp/audispd-pconfig.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/audisp/audispd-pconfig.c b/audisp/audispd-pconfig.c
index a8b7878..a13f681 100644
--- a/audisp/audispd-pconfig.c
+++ b/audisp/audispd-pconfig.c
@@ -510,7 +510,11 @@ void free_pconfig(plugin_conf_t *config)
 		close(config->plug_pipe[0]);
 	if (config->plug_pipe[1] >= 0)
 		close(config->plug_pipe[1]);
+	/* Be paranoid and overwrite config->path with zero bytes before doing the
+	 * free() */
+	memset(config->path, 0, strlen(config->path));
 	free((void *)config->path);
+	config->path = NULL;
 	free((void *)config->name);
 }
 
-- 
2.29.2

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

