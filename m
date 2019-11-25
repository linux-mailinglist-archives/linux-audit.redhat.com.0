Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2033510939C
	for <lists+linux-audit@lfdr.de>; Mon, 25 Nov 2019 19:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574707150;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CFM9GB0VvzwXqZyuBQoBWPHynY2sxgyM//fsj9TYjFM=;
	b=bq1OqtqJcQPgPrVbZn/MbsBUC91KNYwF2dKqrrg/nWpMDdlM23lEYl0jlqdO/TI2MpnT/L
	jVIXv6k9yD2OMZTibXRwBoxNvqhTm7njoUQB9was+cPlbsJYwOfCjlvMJZa+bVoJrCsI2e
	xTdi+62hftKSTcOIRhv0HVtRewxF/xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-iGGJ3nXrMkeOjk9eUIDaQA-1; Mon, 25 Nov 2019 13:39:08 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBAB48E9360;
	Mon, 25 Nov 2019 18:39:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E7CB1001DC0;
	Mon, 25 Nov 2019 18:38:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D7B318095FF;
	Mon, 25 Nov 2019 18:38:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAPIchrZ028820 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 25 Nov 2019 13:38:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1FE925D6B7; Mon, 25 Nov 2019 18:38:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-255.phx2.redhat.com [10.3.116.255])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF9755D6A0;
	Mon, 25 Nov 2019 18:38:38 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] bpf: emit audit messages upon successful prog load and
	unload
Date: Mon, 25 Nov 2019 13:38:38 -0500
Message-ID: <1862228.bWCyuaZ6x9@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhRi0JtKgHyAOdAJ=_--vL1VbK7BDq1FnRQ_GwW9P4J_zA@mail.gmail.com>
References: <20191120213816.8186-1-jolsa@kernel.org>
	<20191122192353.GA2157@krava>
	<CAHC9VhRi0JtKgHyAOdAJ=_--vL1VbK7BDq1FnRQ_GwW9P4J_zA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: Jiri Benc <jbenc@redhat.com>, Andrii Nakryiko <andriin@fb.com>,
	Jakub Kicinski <jakub.kicinski@netronome.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Network Development <netdev@vger.kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
	Jiri Olsa <jolsa@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: iGGJ3nXrMkeOjk9eUIDaQA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Friday, November 22, 2019 4:19:55 PM EST Paul Moore wrote:
> On Fri, Nov 22, 2019 at 2:24 PM Jiri Olsa <jolsa@redhat.com> wrote:
> > Paul,
> > would following output be ok:
> > 
> > type=SYSCALL msg=audit(1574445211.897:28015): arch=c000003e syscall=321
> > success=no exit=-13 a0=5 a1=7fff09ac6c60 a2=78 a3=6 items=0 ppid=1408
> > pid=9266 auid=1001 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0
> > fsgid=0 tty=pts0 ses=1 comm="test_verifier"
> > exe="/home/jolsa/linux/tools/testing/selftests/bpf/test_verifier"
> > subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> > key=(null)ARCH=x86_64 SYSCALL=bpf AUID="jolsa" UID="root" GID="root"
> > EUID="root" SUID="root" FSUID="root" EGID="root" SGID="root"
> > FSGID="root" type=PROCTITLE msg=audit(1574445211.897:28015):
> > proctitle="./test_verifier" type=BPF msg=audit(1574445211.897:28016):
> > prog-id=8103 event=LOAD
> > 
> > type=SYSCALL msg=audit(1574445211.897:28016): arch=c000003e syscall=321
> > success=yes exit=14 a0=5 a1=7fff09ac6b80 a2=78 a3=0 items=0 ppid=1408
> > pid=9266 auid=1001 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0
> > fsgid=0 tty=pts0 ses=1 comm="test_verifier"
> > exe="/home/jolsa/linux/tools/testing/selftests/bpf/test_verifier"
> > subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
> > key=(null)ARCH=x86_64 SYSCALL=bpf AUID="jolsa" UID="root" GID="root"
> > EUID="root" SUID="root" FSUID="root" EGID="root" SGID="root"
> > FSGID="root" type=PROCTITLE msg=audit(1574445211.897:28016):
> > proctitle="./test_verifier" type=BPF msg=audit(1574445211.897:28017):
> > prog-id=8103 event=UNLOAD
>
> There is some precedence in using "op=" instead of "event=" (an audit
> "event" is already a thing, using "event=" here might get confusing).
> I suppose if we are getting really nit-picky you might want to
> lower-case the LOAD/UNLOAD, but generally Steve cares more about these
> things than I do.
> 
> For reference, we have a searchable database of fields here:
> *
> https://github.com/linux-audit/audit-documentation/blob/master/specs/field
> s/field-dictionary.csv

Paul's comments are correct. We generally use op for what operation is being 
performed. This approach looks better. This is fitting in with the audit way 
of doing things. I don't think there would be any user space issues adding 
support for the BPF record.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

