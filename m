Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D4E04112EA3
	for <lists+linux-audit@lfdr.de>; Wed,  4 Dec 2019 16:38:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575473890;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=89iT4a7er4n6emHxvbkoH4ADwG/YdZVbrqMRg9GTdX4=;
	b=iDvsdcIartUJQrSmAqOfQivAWuqEIhJqV1lMYJOJ2LfMs5Hy1ruxC+eUkich9EZJlFWJOu
	fean1katu/f/ZVPtqi79aVYJ0pKJ0IDZRirAVg3Z86AOayfSc7De0CYM37UnSqdkSeQ+Vv
	panoW2GKlXsB4o7gHy7ciIyyi1WhOrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-Kvk8_sfMNOilOselCQ2Vpg-1; Wed, 04 Dec 2019 10:38:09 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADBFA801E76;
	Wed,  4 Dec 2019 15:38:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D210D5D6AE;
	Wed,  4 Dec 2019 15:38:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6F8C1803C32;
	Wed,  4 Dec 2019 15:37:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4FQw7Y012658 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 10:26:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9082210246ED; Wed,  4 Dec 2019 15:26:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (ovpn-204-212.brq.redhat.com [10.40.204.212])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E54610246E3;
	Wed,  4 Dec 2019 15:26:51 +0000 (UTC)
Date: Wed, 4 Dec 2019 16:26:49 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [RFC] bpf: Emit audit messages upon successful prog load and
	unload
Message-ID: <20191204152649.GB15573@krava>
References: <20191128091633.29275-1-jolsa@kernel.org>
	<CAHC9VhQ7zkXdz1V5hQ8PN68-NnCn56TjKA0wCL6ZjHy9Up8fuQ@mail.gmail.com>
	<20191203093837.GC17468@krava>
	<CAHC9VhRhMhsRPj1D2TY3O=Nc6Rx9=o1-Z5ZMjrCepfFY6VtdbQ@mail.gmail.com>
	<20191204140827.GB12431@krava>
	<CAHC9VhTrUQYp8Ubhu_B_fv-HSdwmgYRy+r1p9uKz7WcRfDQBKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTrUQYp8Ubhu_B_fv-HSdwmgYRy+r1p9uKz7WcRfDQBKA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 04 Dec 2019 10:37:50 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Kvk8_sfMNOilOselCQ2Vpg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Dec 04, 2019 at 09:38:10AM -0500, Paul Moore wrote:

SNIP

> > +
> > +static const char * const bpf_audit_str[] = {
> > +       [BPF_AUDIT_LOAD]   = "LOAD",
> > +       [BPF_AUDIT_UNLOAD] = "UNLOAD",
> > +};
> > +
> > +static void bpf_audit_prog(const struct bpf_prog *prog, enum bpf_audit op)
> > +{
> > +       struct audit_context *ctx = NULL;
> > +       struct audit_buffer *ab;
> > +
> > +       if (audit_enabled == AUDIT_OFF)
> > +               return;
> > +       if (op == BPF_AUDIT_LOAD)
> > +               ctx = audit_context();
> > +       ab = audit_log_start(ctx, GFP_ATOMIC, AUDIT_BPF);
> > +       if (unlikely(!ab))
> > +               return;
> > +       audit_log_format(ab, "prog-id=%u op=%s",
> > +                        prog->aux->id, bpf_audit_str[op]);
> > +       audit_log_end(ab);
> > +}
> 
> As mentioned previously, I still think it might be a good idea to
> ensure "op" is within the bounds of bpf_audit_str, but the audit bits
> look reasonable to me.

ok, I'll add that, I'll send out full patch

thanks for the review,
jirka

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

