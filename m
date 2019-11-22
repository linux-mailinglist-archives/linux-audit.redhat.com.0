Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 025AD1072C0
	for <lists+linux-audit@lfdr.de>; Fri, 22 Nov 2019 14:07:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574428073;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=93IotD18B9Gss78smkmnfqEy4zVUY/hqsC0NffYOKbE=;
	b=Ys16B7Or4FAtCVVtkn4/PyMHUfFgP0E/BpE8upKpIemeD+ZSPOEfx14L9lCKvMDz14hp7p
	tLbu8Hj5MM7DGaphK52aeTQ6F7H++WDNBScOGEFTsrebfdnmUw+UTjXMqcjJ78pLn9BpRp
	/APcSfRAeR4RPlr0mftcP63l7dG+1oY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303--YjxipIVO2qxXltd3GiIAQ-1; Fri, 22 Nov 2019 08:07:52 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29EFD107ACCA;
	Fri, 22 Nov 2019 13:07:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0051F61F37;
	Fri, 22 Nov 2019 13:07:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9316D4BB78;
	Fri, 22 Nov 2019 13:07:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM9a2JX009450 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 04:36:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3C01010375C4; Fri, 22 Nov 2019 09:36:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (unknown [10.43.17.48])
	by smtp.corp.redhat.com (Postfix) with SMTP id 866E41036C8A;
	Fri, 22 Nov 2019 09:35:56 +0000 (UTC)
Date: Fri, 22 Nov 2019 10:35:55 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] bpf: emit audit messages upon successful prog load and
	unload
Message-ID: <20191122093555.GC8287@krava>
References: <20191120213816.8186-1-jolsa@kernel.org>
	<8c928ec4-9e43-3e2a-7005-21f40fcca061@iogearbox.net>
	<CAADnVQKu-ZgFTaSMH=Q-jMOYYvE32TF2b2hq1=dmDV8wAf18pg@mail.gmail.com>
	<CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 22 Nov 2019 08:07:20 -0500
Cc: Jiri Benc <jbenc@redhat.com>, Jakub Kicinski <jakub.kicinski@netronome.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: -YjxipIVO2qxXltd3GiIAQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Nov 21, 2019 at 06:41:31PM -0500, Paul Moore wrote:

SNIP

> a common requirement for new audit functionality (link below).  I'm
> also fairly certain we don't want this new BPF record to look like how
> you've coded it up in bpf_audit_prog(); duplicating the fields with
> audit_log_task() is wrong, you've either already got them via an
> associated record (which you get from passing non-NULL as the first
> parameter to audit_log_start()), or you don't because there is no
> associated syscall/task (which you get from passing NULL as the first

ok, I'll send change that reflects this.. together with the test

thanks,
jirka

> parameter).  Please revert, un-merge, etc. this patch from bpf-next;
> it should not go into Linus' tree as written.
>=20
> Audit userspace PR:
> * https://github.com/linux-audit/audit-userspace/pull/104
>=20
> Audit test suite:
> * https://github.com/linux-audit/audit-testsuite
>=20
> Audit folks, here is a link to the thread in the archives:
> * https://lore.kernel.org/bpf/20191120213816.8186-1-jolsa@kernel.org/T/#u
>=20
> --=20
> paul moore
> www.paul-moore.com
>=20

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

