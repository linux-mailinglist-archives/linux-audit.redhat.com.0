Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEE1235473
	for <lists+linux-audit@lfdr.de>; Sat,  1 Aug 2020 23:46:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-jzsWTTyrM62bd52s_oDu0A-1; Sat, 01 Aug 2020 17:46:03 -0400
X-MC-Unique: jzsWTTyrM62bd52s_oDu0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C727107ACCA;
	Sat,  1 Aug 2020 21:45:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 811847C115;
	Sat,  1 Aug 2020 21:45:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 527E31809554;
	Sat,  1 Aug 2020 21:45:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 071J5p5c022938 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 1 Aug 2020 15:05:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 47DE4114F252; Sat,  1 Aug 2020 19:05:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4361E114F251
	for <linux-audit@redhat.com>; Sat,  1 Aug 2020 19:05:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8BF6185A78B
	for <linux-audit@redhat.com>; Sat,  1 Aug 2020 19:05:48 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0097.hostedemail.com
	[216.40.44.97]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-23-QlUlttK1OkmCdjPIbV0Ayg-1; Sat, 01 Aug 2020 15:05:45 -0400
X-MC-Unique: QlUlttK1OkmCdjPIbV0Ayg-1
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
	[10.5.19.251])
	by smtpgrave06.hostedemail.com (Postfix) with ESMTP id CE2598122D46;
	Sat,  1 Aug 2020 18:55:47 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay06.hostedemail.com (Postfix) with ESMTP id D684A18224D61;
	Sat,  1 Aug 2020 18:55:45 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
	RULES_HIT:41:355:379:599:968:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3350:3622:3865:3866:3868:4321:5007:10004:10400:10848:11026:11232:11473:11658:11914:12297:12438:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21627:21795:30051:30054:30091,
	0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
	DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none,
	Custom_rules:0:0:0, LFtime:1, LUA_SUMMARY:none
X-HE-Tag: lock15_30178ef26f8e
X-Filterd-Recvd-Size: 1511
Received: from XPS-9350.home (unknown [47.151.133.149])
	(Authenticated sender: joe@perches.com)
	by omf15.hostedemail.com (Postfix) with ESMTPA;
	Sat,  1 Aug 2020 18:55:44 +0000 (UTC)
Message-ID: <91c6c45f0d8ec0d031c216711cd8d7f6e9aad7ad.camel@perches.com>
Subject: Re: [PATCH 2/4] audit: uninitialize global variable audit_sig_sid
From: Joe Perches <joe@perches.com>
To: Jules Irenge <jbi.octave@gmail.com>, linux-kernel@vger.kernel.org
Date: Sat, 01 Aug 2020 11:55:43 -0700
In-Reply-To: <20200801184603.310769-3-jbi.octave@gmail.com>
References: <0/4> <20200801184603.310769-1-jbi.octave@gmail.com>
	<20200801184603.310769-3-jbi.octave@gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Sat, 01 Aug 2020 17:45:19 -0400
Cc: "moderated list:AUDIT SUBSYSTEM" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2020-08-01 at 19:46 +0100, Jules Irenge wrote:
> Checkpatch tool reports an error at variable audit_sig_sid declaration
[]
> diff --git a/kernel/audit.c b/kernel/audit.c
[]
> @@ -125,7 +125,7 @@ static u32	audit_backlog_wait_time = AUDIT_BACKLOG_WAIT_TIME;
>  /* The identity of the user shutting down the audit system. */
>  kuid_t		audit_sig_uid = INVALID_UID;
>  pid_t		audit_sig_pid = -1;
> -u32		audit_sig_sid = 0;
> +u32		audit_sig_sid;

All of these are unused outside of audit.c and might as
well be static and removed from the .h file.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

