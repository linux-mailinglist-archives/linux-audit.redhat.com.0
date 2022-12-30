Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFEB65D4FE
	for <lists+linux-audit@lfdr.de>; Wed,  4 Jan 2023 15:07:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672841255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1iJZDVBEr9hCTlyaZzCg6n6K2mlUxX5sVTV+Ck8K0/8=;
	b=KLFvBnIa0kA0R+pGfO8cF+zHrVW3HeN7YSpnB4gmBlj3cKJHutcR4kNclbyNfRMc9TyAuS
	e49F9Bd+UlRayv8NG8/7yEb8tvzHEete7mMWqzL4FpQfdFsnctnSGMmSAx/siU85m8WAmN
	MKb29AqFkDjy3syeIRc171eVwK9a0SY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-oA4lf7CdPbmOO_1uh9vaeg-1; Wed, 04 Jan 2023 09:07:32 -0500
X-MC-Unique: oA4lf7CdPbmOO_1uh9vaeg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E9618533DB;
	Wed,  4 Jan 2023 14:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D03091121318;
	Wed,  4 Jan 2023 14:07:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C022B19465B5;
	Wed,  4 Jan 2023 14:07:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2FA651946586 for <linux-audit@listman.corp.redhat.com>;
 Fri, 30 Dec 2022 03:10:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E5C98112132D; Fri, 30 Dec 2022 03:10:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE863112132C
 for <linux-audit@redhat.com>; Fri, 30 Dec 2022 03:10:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE612101A521
 for <linux-audit@redhat.com>; Fri, 30 Dec 2022 03:10:50 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-3V_Rr4f2ObOlqqxRVsJ-Yg-1; Thu, 29 Dec 2022 22:10:47 -0500
X-MC-Unique: 3V_Rr4f2ObOlqqxRVsJ-Yg-1
Received: by mail-ed1-f48.google.com with SMTP id g1so14773834edj.8
 for <linux-audit@redhat.com>; Thu, 29 Dec 2022 19:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RYVyCUcNeUublLPHcN05eG9pncvtlfHo7DgzMDH0eOE=;
 b=lrt130grSBiAocvmXoEHr8fjw8zTVyau6xjgzP1W/y/0akgy5u+vmI4a9abV80qUpr
 /mkVUo+807MxQc7fsM6kLdWE0xtv5Kw+P0shmHyxScvwSwUCN4FKzPS3CW2z3rN2/nan
 5gsg9yQWOKQRzAEZ2IiIZWUsAF0rl5Ny99C/qIOt6GO68reeJ0z7EPE4gaiIcHJ/ULfU
 O6ubbcXm1Hl/83knDbSlh5YHdZn2r4iiBcRHyhnMzr5rNNEuRgjE3VSFi2Tu5FI9uukQ
 deTnY7FEZ7c6Jf1rcgqBWGY/rJ7iSYIXuvVBHCkftvCyl+sh8oSXoXV3ek31nAVWSCCv
 TJgg==
X-Gm-Message-State: AFqh2krbdzOKWNed15cerFt0BDHz8KC5uYDqsf3dQ0Dzul2GRMXeGtXz
 Pgmw/+HWGn+wbozCie96tgZJcjf8gFA2BBfu8nWrPXZr2qE=
X-Google-Smtp-Source: AMrXdXv8lhfFwhvMHXOYCAWn8XSH0zwxTxnM1xtWQg9Niy9ULRwY/QpRJo/sRzYL3JsRT6SYtwiuyQEankecE6v1n+E=
X-Received: by 2002:aa7:d417:0:b0:482:6f7c:398 with SMTP id
 z23-20020aa7d417000000b004826f7c0398mr1821320edq.6.1672369846391; Thu, 29 Dec
 2022 19:10:46 -0800 (PST)
MIME-Version: 1.0
References: <CAADnVQ+pgN8m3ApZtk9Vr=iv+OcXcv5hhASCwP6ZJGt9Z2JvMw@mail.gmail.com>
 <20221227033528.1032724-1-stfomichev@yandex.ru>
 <1855474adf8.28e3.85c95baa4474aabc7814e68940a78392@paul-moore.com>
 <CAKH8qBvR3=sSGvgGB_CqCFZhKynxdgatCK7N0mBZs1gBPDvTWw@mail.gmail.com>
In-Reply-To: <CAKH8qBvR3=sSGvgGB_CqCFZhKynxdgatCK7N0mBZs1gBPDvTWw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 29 Dec 2022 19:10:34 -0800
Message-ID: <CAADnVQ+MRTYs9sbN4a1oAV7TJ2bqRS4QE9ShmofQ9M--KQducg@mail.gmail.com>
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
To: Stanislav Fomichev <sdf@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Wed, 04 Jan 2023 14:07:27 +0000
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Burn Alting <burn.alting@iinet.net.au>,
 Stanislav Fomichev <stfomichev@yandex.ru>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, linux-audit@redhat.com,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 29, 2022 at 6:13 PM Stanislav Fomichev <sdf@google.com> wrote:
>
> On Tue, Dec 27, 2022 at 8:40 AM Paul Moore <paul@paul-moore.com> wrote:
> >
> > On December 26, 2022 10:35:49 PM Stanislav Fomichev <stfomichev@yandex.ru>
> > wrote:
> > >> On Fri, Dec 23, 2022 at 5:49 PM Stanislav Fomichev <sdf@google.com> wrote:
> > >> get_func_ip() */
> > >>>> -                               tstamp_type_access:1; /* Accessed
> > >>>> __sk_buff->tstamp_type */
> > >>>> +                               tstamp_type_access:1, /* Accessed
> > >>>> __sk_buff->tstamp_type */
> > >>>> +                               valid_id:1; /* Is bpf_prog::aux::__id valid? */
> > >>>>    enum bpf_prog_type      type;           /* Type of BPF program */
> > >>>>    enum bpf_attach_type    expected_attach_type; /* For some prog types */
> > >>>>    u32                     len;            /* Number of filter blocks */
> > >>>> @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
> > >>>> struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
> > >>>> void bpf_prog_put(struct bpf_prog *prog);
> > >>>>
> > >>>> +static inline u32 bpf_prog_get_id(const struct bpf_prog *prog)
> > >>>> +{
> > >>>> +       if (WARN(!prog->valid_id, "Attempting to use an invalid eBPF program"))
> > >>>> +               return 0;
> > >>>> +       return prog->aux->__id;
> > >>>> +}
> > >>>
> > >>> I'm still missing why we need to have this WARN and have a check at all.
> > >>> IIUC, we're actually too eager in resetting the id to 0, and need to
> > >>> keep that stale id around at least for perf/audit.
> > >>> Why not have a flag only to protect against double-idr_remove
> > >>> bpf_prog_free_id and keep the rest as is?
> > >>> Which places are we concerned about that used to report id=0 but now
> > >>> would report stale id?
> > >>
> > >> What double-idr_remove are you concerned about?
> > >> bpf_prog_by_id() is doing bpf_prog_inc_not_zero
> > >> while __bpf_prog_put just dropped it to zero.
> > >
> > > (traveling, sending from an untested setup, hope it reaches everyone)
> > >
> > > There is a call to bpf_prog_free_id from __bpf_prog_offload_destroy which
> > > tries to make offloaded program disappear from the idr when the netdev
> > > goes offline. So I'm assuming that '!prog->aux->id' check in bpf_prog_free_id
> > > is to handle that case where we do bpf_prog_free_id much earlier than the
> > > rest of the __bpf_prog_put stuff.
> > >
> > >> Maybe just move bpf_prog_free_id() into bpf_prog_put_deferred()
> > >> after perf_event_bpf_event and bpf_audit_prog ?
> > >> Probably can remove the obsolete do_idr_lock bool flag as
> > >> separate patch?
> > >
> > > +1 on removing do_idr_lock separately.
> > >
> > >> Much simpler fix and no code churn.
> > >> Both valid_id and saved_id approaches have flaws.
> > >
> > > Given the __bpf_prog_offload_destroy path above, we still probably need
> > > some flag to indicate that the id has been already removed from the idr?
> >
> > So what do you guys want in a patch?  Is there a consensus on what you
> > would merge to fix this bug/regression?
>
> Can we try the following?
>
> 1. Remove calls to bpf_prog_free_id (and bpf_map_free_id?) from
> kernel/bpf/offload.c; that should make it easier to reason about those
> '!id' checks

calls? you mean a single call, right?

> 2. Move bpf_prog_free_id (and bpf_map_free_id?) to happen after
> audit/perf in kernel/bpf/syscall.c (there are comments that say "must
> be called first", but I don't see why; seems like GET_FD_BY_ID would
> correctly return -ENOENT; maybe Martin can chime in, CC'ed him
> explicitly)

The comment says that it should be removed from idr
before __bpf_prog_put_noref will proceed to clean up.

> 3. (optionally) Remove do_idr_lock arguments (all callers are passing 'true')

yes. please.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

