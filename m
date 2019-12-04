Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2AC112D34
	for <lists+linux-audit@lfdr.de>; Wed,  4 Dec 2019 15:07:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575468433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y6ki12s7OfmlAZHjUU+gZTLkh775a12joFAWTc3W5Rs=;
	b=DGqJbHJq2SDBy3b0yKgSKUptD2SLQcZyGHvU+rCYd5F+W9hBlohVFHkEw51dKkDoUfdP6U
	JmsRJ3wxe3MBOs9q/nwlprokIwsPtV6tFa//fqbs9PdTXxSMOcWzgs0svj/MKMogax1YtC
	ekYmmJSKMLE4egZUqeTRw0Kxrk+U08g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-ErTLlF6vOp281YXLyJ0UwA-1; Wed, 04 Dec 2019 09:07:11 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F42FDBCD;
	Wed,  4 Dec 2019 14:07:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFF6719C68;
	Wed,  4 Dec 2019 14:07:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BE7D5BC09;
	Wed,  4 Dec 2019 14:06:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4E2x96006273 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 09:02:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F3CFA600CE; Wed,  4 Dec 2019 14:02:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (unknown [10.43.17.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FAE4600CC;
	Wed,  4 Dec 2019 14:02:53 +0000 (UTC)
Date: Wed, 4 Dec 2019 15:02:51 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [RFC] bpf: Emit audit messages upon successful prog load and
	unload
Message-ID: <20191204140251.GA11548@krava>
References: <20191128091633.29275-1-jolsa@kernel.org>
	<CAHC9VhQ7zkXdz1V5hQ8PN68-NnCn56TjKA0wCL6ZjHy9Up8fuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQ7zkXdz1V5hQ8PN68-NnCn56TjKA0wCL6ZjHy9Up8fuQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 04 Dec 2019 09:06:50 -0500
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>,
	Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Jiri Benc <jbenc@redhat.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
	Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ErTLlF6vOp281YXLyJ0UwA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Dec 02, 2019 at 06:00:14PM -0500, Paul Moore wrote:

SNIP

> > +
> > +static void bpf_audit_prog(const struct bpf_prog *prog, enum bpf_audit op)
> > +{
> > +       struct audit_buffer *ab;
> > +
> > +       if (audit_enabled == AUDIT_OFF)
> > +               return;
> 
> I think you would probably also want to check the results of
> audit_dummy_context() here as well, see all the various audit_XXX()
> functions in include/linux/audit.h as an example.  You'll see a
> pattern similar to the following:
> 
> static inline void audit_foo(...)
> {
>   if (unlikely(!audit_dummy_context()))
>     __audit_foo(...)
> }
> 
> > +       ab = audit_log_start(audit_context(), GFP_ATOMIC, AUDIT_BPF);
> > +       if (unlikely(!ab))
> > +               return;
> > +       audit_log_format(ab, "prog-id=%u op=%s",
> > +                        prog->aux->id, bpf_audit_str[op]);
> 
> Is it worth putting some checks in here to make sure that you don't
> blow past the end of the bpf_audit_str array?

forgot answer this one..  there are only 2 callers:

  bpf_audit_prog(prog, BPF_AUDIT_UNLOAD);
  bpf_audit_prog(prog, BPF_AUDIT_LOAD);

that's not going to change any time soon,
so I dont think we don't need such check

jirka

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

