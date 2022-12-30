Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CB265D4FF
	for <lists+linux-audit@lfdr.de>; Wed,  4 Jan 2023 15:07:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672841255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o/WQ44ABXB5VAbbzAA7+V9eBVxotShMbYKs8HjnwV7M=;
	b=C1s2Nn5qbAzmoPA4FMHPPJZdz0AnjQSZkLlPJ8WFf6xPAEktu+8ML4H9U3405DD/in+c3O
	L+6fBkEXd1nCdEqWvuutzwkVSx80VL9x17KsFnz4WxRum/iNyCkcY84v112YehebNncPxj
	hYub3RZQ3yzkZoQn6QwR6NhEKWV3hik=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-j0qknsQ3O-SFNLeMjQxu4g-1; Wed, 04 Jan 2023 09:07:33 -0500
X-MC-Unique: j0qknsQ3O-SFNLeMjQxu4g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C9DB8030CB;
	Wed,  4 Jan 2023 14:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F6EA40104C;
	Wed,  4 Jan 2023 14:07:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D6A331947041;
	Wed,  4 Jan 2023 14:07:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6C1B51946586 for <linux-audit@listman.corp.redhat.com>;
 Fri, 30 Dec 2022 03:38:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1A72D492B01; Fri, 30 Dec 2022 03:38:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12DA0492B00
 for <linux-audit@redhat.com>; Fri, 30 Dec 2022 03:38:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74A573C02B7E
 for <linux-audit@redhat.com>; Fri, 30 Dec 2022 03:38:35 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-vohD6d0KPoqgF03DaPqlgQ-1; Thu, 29 Dec 2022 22:38:33 -0500
X-MC-Unique: vohD6d0KPoqgF03DaPqlgQ-1
Received: by mail-pl1-f176.google.com with SMTP id y19so1689496plb.2
 for <linux-audit@redhat.com>; Thu, 29 Dec 2022 19:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5fydax2I5e8hodR7TsTth7TEIP2I2sf/t20unGpGvPU=;
 b=pIh1MXyMLrsPhjHBo3/ePpozyz3ftRLQ9nnMDCdKKe2aUcMiRVg1fQe612zwVlz+tq
 FiCmLyqygUcEqAYn3S6RuU9BcjM5JaERenIg++s/toke9743MdV7j5pG6pMzQhSsm7Vx
 BN0mjq7wuWqzsaQXbHH1mGipyfqGGbByZnGWBqb8+Sc0EuiyenQjOrK4bR4FvlAvz1wz
 GRry5DNfSSkizmr8KRS9b4QC2Scg+oD+9WsxdcDi9/ELawts36f3lacyFAo12DjkpCax
 SNLcL0quGfpW4Dk/YgPFAAe4rRlmNT7BNqe+XRWFcsO45+RrlimCLhTy7oUWc9t1xj0M
 JATw==
X-Gm-Message-State: AFqh2koq8Mk7blNJjxv021xUl0adXO4xraeB4CYT0oMTmbIM0OQCLlqi
 m/aTzXxoWioRte1Mu7MxXILDFeCmP81iRgDR8qpQAA==
X-Google-Smtp-Source: AMrXdXv4sT7d1E5xTQ1OLVal0h9ETKqceM6oFv050lNNRkQVd8/d3SOuoUbV3z1O+qFefPhXQrIQU9To83Ly6L2v+do=
X-Received: by 2002:a17:902:b20d:b0:191:283d:612e with SMTP id
 t13-20020a170902b20d00b00191283d612emr1471231plr.88.1672371511611; Thu, 29
 Dec 2022 19:38:31 -0800 (PST)
MIME-Version: 1.0
References: <CAADnVQ+pgN8m3ApZtk9Vr=iv+OcXcv5hhASCwP6ZJGt9Z2JvMw@mail.gmail.com>
 <20221227033528.1032724-1-stfomichev@yandex.ru>
 <1855474adf8.28e3.85c95baa4474aabc7814e68940a78392@paul-moore.com>
 <CAKH8qBvR3=sSGvgGB_CqCFZhKynxdgatCK7N0mBZs1gBPDvTWw@mail.gmail.com>
 <CAADnVQ+MRTYs9sbN4a1oAV7TJ2bqRS4QE9ShmofQ9M--KQducg@mail.gmail.com>
In-Reply-To: <CAADnVQ+MRTYs9sbN4a1oAV7TJ2bqRS4QE9ShmofQ9M--KQducg@mail.gmail.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Thu, 29 Dec 2022 19:38:19 -0800
Message-ID: <CAKH8qBsN+ypbKyE-oiTzmH06ML71TmN9zqEr4=6KvXwt8TE0QQ@mail.gmail.com>
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Wed, 04 Jan 2023 14:07:19 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 29, 2022 at 7:10 PM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Dec 29, 2022 at 6:13 PM Stanislav Fomichev <sdf@google.com> wrote:
> >
> > On Tue, Dec 27, 2022 at 8:40 AM Paul Moore <paul@paul-moore.com> wrote:
> > >
> > > On December 26, 2022 10:35:49 PM Stanislav Fomichev <stfomichev@yandex.ru>
> > > wrote:
> > > >> On Fri, Dec 23, 2022 at 5:49 PM Stanislav Fomichev <sdf@google.com> wrote:
> > > >> get_func_ip() */
> > > >>>> -                               tstamp_type_access:1; /* Accessed
> > > >>>> __sk_buff->tstamp_type */
> > > >>>> +                               tstamp_type_access:1, /* Accessed
> > > >>>> __sk_buff->tstamp_type */
> > > >>>> +                               valid_id:1; /* Is bpf_prog::aux::__id valid? */
> > > >>>>    enum bpf_prog_type      type;           /* Type of BPF program */
> > > >>>>    enum bpf_attach_type    expected_attach_type; /* For some prog types */
> > > >>>>    u32                     len;            /* Number of filter blocks */
> > > >>>> @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
> > > >>>> struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
> > > >>>> void bpf_prog_put(struct bpf_prog *prog);
> > > >>>>
> > > >>>> +static inline u32 bpf_prog_get_id(const struct bpf_prog *prog)
> > > >>>> +{
> > > >>>> +       if (WARN(!prog->valid_id, "Attempting to use an invalid eBPF program"))
> > > >>>> +               return 0;
> > > >>>> +       return prog->aux->__id;
> > > >>>> +}
> > > >>>
> > > >>> I'm still missing why we need to have this WARN and have a check at all.
> > > >>> IIUC, we're actually too eager in resetting the id to 0, and need to
> > > >>> keep that stale id around at least for perf/audit.
> > > >>> Why not have a flag only to protect against double-idr_remove
> > > >>> bpf_prog_free_id and keep the rest as is?
> > > >>> Which places are we concerned about that used to report id=0 but now
> > > >>> would report stale id?
> > > >>
> > > >> What double-idr_remove are you concerned about?
> > > >> bpf_prog_by_id() is doing bpf_prog_inc_not_zero
> > > >> while __bpf_prog_put just dropped it to zero.
> > > >
> > > > (traveling, sending from an untested setup, hope it reaches everyone)
> > > >
> > > > There is a call to bpf_prog_free_id from __bpf_prog_offload_destroy which
> > > > tries to make offloaded program disappear from the idr when the netdev
> > > > goes offline. So I'm assuming that '!prog->aux->id' check in bpf_prog_free_id
> > > > is to handle that case where we do bpf_prog_free_id much earlier than the
> > > > rest of the __bpf_prog_put stuff.
> > > >
> > > >> Maybe just move bpf_prog_free_id() into bpf_prog_put_deferred()
> > > >> after perf_event_bpf_event and bpf_audit_prog ?
> > > >> Probably can remove the obsolete do_idr_lock bool flag as
> > > >> separate patch?
> > > >
> > > > +1 on removing do_idr_lock separately.
> > > >
> > > >> Much simpler fix and no code churn.
> > > >> Both valid_id and saved_id approaches have flaws.
> > > >
> > > > Given the __bpf_prog_offload_destroy path above, we still probably need
> > > > some flag to indicate that the id has been already removed from the idr?
> > >
> > > So what do you guys want in a patch?  Is there a consensus on what you
> > > would merge to fix this bug/regression?
> >
> > Can we try the following?
> >
> > 1. Remove calls to bpf_prog_free_id (and bpf_map_free_id?) from
> > kernel/bpf/offload.c; that should make it easier to reason about those
> > '!id' checks
>
> calls? you mean a single call, right?

Right, there is a single call to bpf_prog_free_id. But there is also
another single call to bpf_map_free_id with the same "remove it from
idr so it can't be found if GET_NEXT_ID" reasoning.
It's probably worth it to look into whether we can remove it as well
to have consistent id management for progs and maps?

> > 2. Move bpf_prog_free_id (and bpf_map_free_id?) to happen after
> > audit/perf in kernel/bpf/syscall.c (there are comments that say "must
> > be called first", but I don't see why; seems like GET_FD_BY_ID would
> > correctly return -ENOENT; maybe Martin can chime in, CC'ed him
> > explicitly)
>
> The comment says that it should be removed from idr
> before __bpf_prog_put_noref will proceed to clean up.

Which one? I was trying to see if there is any reasoning in the
original commit 34ad5580f8f9 ("bpf: Add BPF_(PROG|MAP)_GET_NEXT_ID
command"), but couldn't find anything useful :-(

> > 3. (optionally) Remove do_idr_lock arguments (all callers are passing 'true')
>
> yes. please.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

