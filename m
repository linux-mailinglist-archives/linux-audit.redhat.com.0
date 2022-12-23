Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8D565520A
	for <lists+linux-audit@lfdr.de>; Fri, 23 Dec 2022 16:30:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671809436;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uJ2+pGodz4Deo/3waQYG0nUCAi7POj5r9To7Kh8TZ5U=;
	b=iPUke4XvEg7U+ee9LlcAs1W1FICA8imUewzCUJLm1TimRC97APsjBUDKuPg96U1ngLuO4E
	dz0qpto4QU0wa8CSLpl46ZJqz6UnzA1fngzz6kmGdcyFB1JXWVOHY7ZNrIgMgZG0wu8YuE
	b5cAHybN3EEB7lWADEOolNVHrE6b5U8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-fNOOYfuqPjWmNaeLj-_VMw-1; Fri, 23 Dec 2022 10:30:35 -0500
X-MC-Unique: fNOOYfuqPjWmNaeLj-_VMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21B6E3C0DDCD;
	Fri, 23 Dec 2022 15:30:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DAC1A111F3BB;
	Fri, 23 Dec 2022 15:30:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 964C81946A40;
	Fri, 23 Dec 2022 15:30:24 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5958519465B1 for <linux-audit@listman.corp.redhat.com>;
 Fri, 23 Dec 2022 15:30:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 43506492B02; Fri, 23 Dec 2022 15:30:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE89492B00
 for <linux-audit@redhat.com>; Fri, 23 Dec 2022 15:30:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CFA9299E74A
 for <linux-audit@redhat.com>; Fri, 23 Dec 2022 15:30:23 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-A7-hX25BPQCzK-yfR4QgWg-1; Fri, 23 Dec 2022 10:30:21 -0500
X-MC-Unique: A7-hX25BPQCzK-yfR4QgWg-1
Received: by mail-pf1-f175.google.com with SMTP id t18so3528998pfq.13
 for <linux-audit@redhat.com>; Fri, 23 Dec 2022 07:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sC5sLWXn+hX58uHQr6oilZ1kqWbaxgV442Q41BCVgn4=;
 b=okCUAClbdJ8Av4N9ATjfluB9QlBHaolWuPlMOZPvRey1LSLkZmnCko1q9ArwLYj0Op
 DvvPUeawLlHujZYZKIDcTky8DrrJd9hZI0NorS7jCX1lg127lrAX0YTXeAst4HpEp+9U
 mmMhwfiVjktlcC1aBwdeHass5ONgkoQB3eLfeQQmv2eVfKLTuF0/yJeSJ3j1w42Ql92c
 F03xb5p0w52nZTEdcKM1WFiq4VDQFHi9EL8ah+jmIT8fnHRGL3mUh4KcYgOrari3TIY9
 IbsiKNOpX3nsTuuNkDlf7tn6ggTkObiF+b9tAf5W97FcC88DZNr1psNoPzaHQ7kUfV8F
 inXA==
X-Gm-Message-State: AFqh2kpOlXBVp/eiE/4ZyvOz04wHkpnu6/uoRH6rNGwOnQtetBuqdpxu
 XZK95ZG4NMHjnKGsZSNhCUd8B/BDcClgP0GQkjQu
X-Google-Smtp-Source: AMrXdXsvxEs8bgnHBFHsKDnWAw8jymmyXBBkiyYSYU7VEXbwec1PAe5vQfQpStJhaVLRuHJR4U5y8uL32gQXxMfQ7i8=
X-Received: by 2002:a05:6a00:1f1a:b0:576:af2d:4c5f with SMTP id
 be26-20020a056a001f1a00b00576af2d4c5fmr631350pfb.23.1671809419937; Fri, 23
 Dec 2022 07:30:19 -0800 (PST)
MIME-Version: 1.0
References: <20221222001343.489117-1-paul@paul-moore.com>
 <Y6SRiv+FloijdETe@google.com>
 <CAHC9VhRFmrgXMYKxXqd1KpMzDGhT6gPX-=8Z072utZO_WefYWQ@mail.gmail.com>
 <Y6SysZgKKEPL5ZE5@google.com>
 <CAHC9VhQ4EPzQ56ix9he4ZTo7eYpMdLBPpb+3vNsng_9vD2t=RQ@mail.gmail.com>
 <CAHC9VhSwpV80pPjzc2w9r--16LXuG7vYxE1eg5MCz2ytn2TH7g@mail.gmail.com>
 <CAKH8qBszD=PYO_nVjYUTnj7UXVcBvA95meULQGs53eyo9xfD+A@mail.gmail.com>
In-Reply-To: <CAKH8qBszD=PYO_nVjYUTnj7UXVcBvA95meULQGs53eyo9xfD+A@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 23 Dec 2022 10:30:08 -0500
Message-ID: <CAHC9VhTdRC8VqrnnHaM=jBtrgdb2KrqM7-4Z==qcQTosbXfJMg@mail.gmail.com>
Subject: Re: [PATCH] bpf: restore the ebpf audit UNLOAD id field
To: Stanislav Fomichev <sdf@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: bpf@vger.kernel.org, linux-audit@redhat.com,
 Burn Alting <burn.alting@iinet.net.au>, Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 4:28 PM Stanislav Fomichev <sdf@google.com> wrote:
> On Thu, Dec 22, 2022 at 12:07 PM Paul Moore <paul@paul-moore.com> wrote:
> > On Thu, Dec 22, 2022 at 2:59 PM Paul Moore <paul@paul-moore.com> wrote:
> > > On Thu, Dec 22, 2022 at 2:40 PM <sdf@google.com> wrote:
> > > > On 12/22, Paul Moore wrote:
> > > > > On Thu, Dec 22, 2022 at 12:19 PM <sdf@google.com> wrote:
> > > > > > On 12/21, Paul Moore wrote:

...

> > > FWIW, the currently-work-in-progress v2 patch adds a getter for the ID
> > > with a WARN() check to flag callers who are trying to access a
> > > bad/free'd bpf_prog.  Unfortunately it touches a decent chunk of code,
> > > but I think it might be a nice additional check at runtime.
> > >
> > > +u32 bpf_prog_get_id(const struct bpf_prog *prog)
> > > +{
> > > +       if (WARN(!prog->valid_id, "Attempting to use invalid eBPF program"))
> > > +               return 0;
> > > +       return prog->aux->__id;
> > > +}
> >
> > I should add that the getter is currently a static inline in bpf.h.
>
> I don't see why we need to WARN on !valid_id, but I might be missing something.
> There are no places currently where we report 'id == 0' to the
> userspace, so we only need to take care of the offloaded case that
> resets id to zero early (instead of resetting it during regular
> __bpf_prog_put path).

I put the WARN there, in place of a normal 'if (!prog->valid_id)', as
an extra runtime check/debug-tool for those who have CONFIG_BUG
enabled.  I'm sure everything works properly now with respect to not
using a bpf_prog reference after it has been free'd/released, but
mistakes do happen - look at the regression/bug that started this
thread :)

If you really don't want the WARN() there, I can replace it with the
simple '!prog->valid_id' check, let me know.  It's your code, you
should maintain it how you want; I just want to make sure we are
generating audit records correctly.

> > > > > I'm not seeing any other comments, so I'll go ahead with putting
> > > > > together a v2 that sets an invalid flag/bit and I'll post that for
> > > > > further discussion/review.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

