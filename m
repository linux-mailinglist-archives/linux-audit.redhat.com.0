Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9F58E108EE3
	for <lists+linux-audit@lfdr.de>; Mon, 25 Nov 2019 14:30:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574688640;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CnO2IA0X2JY3NxPeAZRVLP5Fbfd0P8djCSZfCbIWzOU=;
	b=faBAd78GXlRZ6Hkqgyp43RhaGOistlpFGYzez5hmujczc75Eb/9TVSoOA9STv6pl7xMtdA
	oFLgdyv1J1kSBwB7iie5Ku74rmyInILhlhRG5vsYYEHTfUJDubxzGhuC50eC7ITRrjT1P2
	uf6jmWrBmFy9bRrVD69zUF51qNj2sq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-HSVGCsNZOMqQHU_xeg_Y5g-1; Mon, 25 Nov 2019 08:30:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2046800581;
	Mon, 25 Nov 2019 13:30:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C578960C88;
	Mon, 25 Nov 2019 13:30:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EBDB182B00F;
	Mon, 25 Nov 2019 13:30:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAOMcYrJ024310 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 24 Nov 2019 17:38:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DD6C85C1D8; Sun, 24 Nov 2019 22:38:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (ovpn-204-42.brq.redhat.com [10.40.204.42])
	by smtp.corp.redhat.com (Postfix) with SMTP id 542E25C1D4;
	Sun, 24 Nov 2019 22:38:28 +0000 (UTC)
Date: Sun, 24 Nov 2019 23:38:27 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [PATCH] bpf: emit audit messages upon successful prog load and
	unload
Message-ID: <20191124223742.GA20575@krava>
References: <20191120213816.8186-1-jolsa@kernel.org>
	<8c928ec4-9e43-3e2a-7005-21f40fcca061@iogearbox.net>
	<CAADnVQKu-ZgFTaSMH=Q-jMOYYvE32TF2b2hq1=dmDV8wAf18pg@mail.gmail.com>
	<CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
	<20191122002257.4hgui6pylpkmpwac@ast-mbp.dhcp.thefacebook.com>
	<CAHC9VhRihMi_d-p+ieXyuVBcGMs80SkypVxF4gLE_s45GKP0dg@mail.gmail.com>
	<20191122192353.GA2157@krava>
	<CAHC9VhRi0JtKgHyAOdAJ=_--vL1VbK7BDq1FnRQ_GwW9P4J_zA@mail.gmail.com>
	<20191123085719.GA1673@krava>
	<20191123100340.771bfd25@cakuba.netronome.com>
MIME-Version: 1.0
In-Reply-To: <20191123100340.771bfd25@cakuba.netronome.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:30:17 -0500
Cc: Jiri Benc <jbenc@redhat.com>, Daniel Borkmann <daniel@iogearbox.net>,
	Network Development <netdev@vger.kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
	Andrii Nakryiko <andriin@fb.com>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
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
X-MC-Unique: HSVGCsNZOMqQHU_xeg_Y5g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Nov 23, 2019 at 10:03:40AM -0800, Jakub Kicinski wrote:
> On Sat, 23 Nov 2019 09:57:19 +0100, Jiri Olsa wrote:
> > Alexei already asked Dave to revert this in previous email,
> > so that should happen
> 
> Reverted in net-next now.
> 
> But this is not really how this should work. You should post a proper
> revert patch to netdev for review, with an explanation in the commit
> message etc.

I had no idea I need to post the revert, sorry
will do next time

thanks,
jirka

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

