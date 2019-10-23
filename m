Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA9CE4795
	for <lists+linux-audit@lfdr.de>; Fri, 25 Oct 2019 11:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571996577;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EEgtaX/+4ia3HNt6zaGp55khHKHzrcRHF1j3kc3QJNQ=;
	b=HpBhOG6KiRcKydNN1tPGd8ScRZF/gzwRZN8gXcLBsnIpeVY3MVdp868Ys3shNN6CU+C2+h
	tO+7C1/i5bRqa7HrXkTIDTSeSbne7aJeRoSdVTPxUxjoON9ouVlQnzc1PQXrtM7fu5yet9
	aRFcApqbWbAkVCTlmyzq7UWPu7zQSys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-Y0S_zeEzNH-dL7joL7wgCg-1; Fri, 25 Oct 2019 05:42:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94FEC5E6;
	Fri, 25 Oct 2019 09:42:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E82960161;
	Fri, 25 Oct 2019 09:42:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C5531800B74;
	Fri, 25 Oct 2019 09:42:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9NInJgT012289 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 23 Oct 2019 14:49:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 143C060C83; Wed, 23 Oct 2019 18:49:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D80560C63
	for <linux-audit@redhat.com>; Wed, 23 Oct 2019 18:49:14 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0108.hostedemail.com
	[216.40.44.108])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C56FB7F759
	for <linux-audit@redhat.com>; Wed, 23 Oct 2019 18:49:12 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay06.hostedemail.com (Postfix) with ESMTP id B81DA1822327E;
	Wed, 23 Oct 2019 18:49:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
	:::::::::::::::::::,
	RULES_HIT:41:355:379:599:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2689:2693:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3870:3871:3873:4321:5007:10004:10400:11232:11658:11914:12050:12297:12740:12760:12895:13069:13255:13311:13357:13439:14181:14659:14721:21080:21451:21627:30054:30090:30091,
	0,
	RBL:47.151.135.224:@perches.com:.lbl8.mailshell.net-62.8.0.100
	64.201.201.201, CacheIP:none, Bayesian:0.5, 0.5, 0.5,
	Netcheck:none, DomainCache:0, MSF:not bulk, SPF:fn, MSBL:0,
	DNSBL:neutral, Custom_rules:0:0:0, LFtime:25, LUA_SUMMARY:none
X-HE-Tag: seed76_500e99da2a55d
X-Filterd-Recvd-Size: 1829
Received: from XPS-9350.home (unknown [47.151.135.224])
	(Authenticated sender: joe@perches.com)
	by omf09.hostedemail.com (Postfix) with ESMTPA;
	Wed, 23 Oct 2019 18:49:10 +0000 (UTC)
Message-ID: <bff0a1c4fc69b83c763ffbce42a0152e1573499a.camel@perches.com>
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: convert switch/case
	fallthrough comments to fallthrough;
From: Joe Perches <joe@perches.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 23 Oct 2019 11:49:08 -0700
In-Reply-To: <20191021090909.yjyed4qodjjcioqc@holly.lan>
References: <f31b38b9ad515a138edaecf85701b1e3db064114.camel@perches.com>
	<20191021090909.yjyed4qodjjcioqc@holly.lan>
User-Agent: Evolution 3.32.1-2
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Wed, 23 Oct 2019 18:49:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Wed, 23 Oct 2019 18:49:13 +0000 (UTC) for IP:'216.40.44.108'
	DOMAIN:'smtprelay0108.hostedemail.com'
	HELO:'smtprelay.hostedemail.com' FROM:'joe@perches.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 216.40.44.108 smtprelay0108.hostedemail.com
	216.40.44.108 smtprelay0108.hostedemail.com <joe@perches.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 25 Oct 2019 05:42:32 -0400
Cc: linux-pm@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Y0S_zeEzNH-dL7joL7wgCg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-10-21 at 10:09 +0100, Daniel Thompson wrote:
> On Fri, Oct 18, 2019 at 09:35:08AM -0700, Joe Perches wrote:
> > Use the new pseudo keyword "fallthrough;" and not the
> > various /* fallthrough */ style comments.
> >=20
> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> >=20
> > This is a single patch for the kernel/ source tree,
> > which would otherwise be sent through as separate
> > patches to 19 maintainer sections.
>=20
> For the kernel/debug/ files:
>=20
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
>=20
> Will you be putting this in an immutable branch once you've collected
> enough acks?

No, I expect Linus will either run the script
or apply this patch one day.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

