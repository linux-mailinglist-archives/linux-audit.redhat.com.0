Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDD265D4FC
	for <lists+linux-audit@lfdr.de>; Wed,  4 Jan 2023 15:07:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672841253;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xwFC3i6W2vkzmniEYE/nnEL5ek7CnYrtsX5eQNAuhCQ=;
	b=LRsAuRJF6HyOvzVUz/67ZOgB8nsfYwhUr1X+RwTfYOtqueZKW6Wf3pxKMDvn6ANAcAgW61
	u35YJL45qu1iawLs8w+jAGpaks6HiShafmnJqBu23Qf/N4JqU3Vghd1eEj//HrOOgR7gUK
	KFuQ3jA18hgV9HSFBu6lKahUXM65BeQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-7o3wRNutNhWrKxJs_vU5Yw-1; Wed, 04 Jan 2023 09:07:32 -0500
X-MC-Unique: 7o3wRNutNhWrKxJs_vU5Yw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DD3B8533DA;
	Wed,  4 Jan 2023 14:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98F45C15BAD;
	Wed,  4 Jan 2023 14:07:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 875CA19465B7;
	Wed,  4 Jan 2023 14:07:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CB5A71946586 for <linux-audit@listman.corp.redhat.com>;
 Fri, 30 Dec 2022 02:13:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A9C6AC16026; Fri, 30 Dec 2022 02:13:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A280FC16025
 for <linux-audit@redhat.com>; Fri, 30 Dec 2022 02:13:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 884531869B6C
 for <linux-audit@redhat.com>; Fri, 30 Dec 2022 02:13:31 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-9ZfDf3uDOqmqG9j1hpyHcA-1; Thu, 29 Dec 2022 21:13:26 -0500
X-MC-Unique: 9ZfDf3uDOqmqG9j1hpyHcA-1
Received: by mail-pl1-f181.google.com with SMTP id 20so7151988plo.3
 for <linux-audit@redhat.com>; Thu, 29 Dec 2022 18:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7xY4VLmipIcyrPbQHM+K5bvSivcl9z5G6MG2IKjbN8M=;
 b=gbTzmMRURb6x1x9yhhV2fuwyZWFAvYAmyyjIWxRPxqLKfZCaaOqVUXGKQEy5aBLUJh
 Cwgw7kVBY6/YoG1uit3yOiMQL0Dlm64T1O3x//zTQQGF5ym5NYOIXNMVXiES1oWQEEr4
 qtWNC/YGz8U9Eu8jaQq7i/wsO+AbfwNNXG+NxS9iAyuao4s2F+uNPWm3ugeY2akn6EDJ
 jdU1RhmhJwjS01OyVtHImXCM824yHGnSmkzMsTOBO2WPmDUWslRS8iVS2qSTS9Z/pMqY
 jvj8x4qnBKQv7IuNUpF86D2tfby4aSox9V8hcPBfkJIoORDiaHi40v0zIDHagbKZpNCt
 gcvA==
X-Gm-Message-State: AFqh2ko5tjyl7hYoP/d+OEYwuoRLJUVKBPZmMNHkSs88AXpips0HFbGs
 aQOZvPupc6GSW3TeAJuJY+YYgEfbyV7TzA/yCdjOQQ==
X-Google-Smtp-Source: AMrXdXtUgH27o5mLWa/y9Pzg1vrr+LBDxCdlXIOq4bJHnGqVqGaTs1tyVZTTTPZLey2JdEsNDQBQWMWEI8hjslwMzE4=
X-Received: by 2002:a17:90a:5296:b0:219:fbc:a088 with SMTP id
 w22-20020a17090a529600b002190fbca088mr3044200pjh.162.1672366405062; Thu, 29
 Dec 2022 18:13:25 -0800 (PST)
MIME-Version: 1.0
References: <CAADnVQ+pgN8m3ApZtk9Vr=iv+OcXcv5hhASCwP6ZJGt9Z2JvMw@mail.gmail.com>
 <20221227033528.1032724-1-stfomichev@yandex.ru>
 <1855474adf8.28e3.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <1855474adf8.28e3.85c95baa4474aabc7814e68940a78392@paul-moore.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Thu, 29 Dec 2022 18:13:13 -0800
Message-ID: <CAKH8qBvR3=sSGvgGB_CqCFZhKynxdgatCK7N0mBZs1gBPDvTWw@mail.gmail.com>
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: burn.alting@iinet.net.au, daniel@iogearbox.net,
 Stanislav Fomichev <stfomichev@yandex.ru>, ast@kernel.org, andrii@kernel.org,
 linux-audit@redhat.com, jolsa@kernel.org, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>, alexei.starovoitov@gmail.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 27, 2022 at 8:40 AM Paul Moore <paul@paul-moore.com> wrote:
>
> On December 26, 2022 10:35:49 PM Stanislav Fomichev <stfomichev@yandex.ru>
> wrote:
> >> On Fri, Dec 23, 2022 at 5:49 PM Stanislav Fomichev <sdf@google.com> wrote:
> >> get_func_ip() */
> >>>> -                               tstamp_type_access:1; /* Accessed
> >>>> __sk_buff->tstamp_type */
> >>>> +                               tstamp_type_access:1, /* Accessed
> >>>> __sk_buff->tstamp_type */
> >>>> +                               valid_id:1; /* Is bpf_prog::aux::__id valid? */
> >>>>    enum bpf_prog_type      type;           /* Type of BPF program */
> >>>>    enum bpf_attach_type    expected_attach_type; /* For some prog types */
> >>>>    u32                     len;            /* Number of filter blocks */
> >>>> @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
> >>>> struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
> >>>> void bpf_prog_put(struct bpf_prog *prog);
> >>>>
> >>>> +static inline u32 bpf_prog_get_id(const struct bpf_prog *prog)
> >>>> +{
> >>>> +       if (WARN(!prog->valid_id, "Attempting to use an invalid eBPF program"))
> >>>> +               return 0;
> >>>> +       return prog->aux->__id;
> >>>> +}
> >>>
> >>> I'm still missing why we need to have this WARN and have a check at all.
> >>> IIUC, we're actually too eager in resetting the id to 0, and need to
> >>> keep that stale id around at least for perf/audit.
> >>> Why not have a flag only to protect against double-idr_remove
> >>> bpf_prog_free_id and keep the rest as is?
> >>> Which places are we concerned about that used to report id=0 but now
> >>> would report stale id?
> >>
> >> What double-idr_remove are you concerned about?
> >> bpf_prog_by_id() is doing bpf_prog_inc_not_zero
> >> while __bpf_prog_put just dropped it to zero.
> >
> > (traveling, sending from an untested setup, hope it reaches everyone)
> >
> > There is a call to bpf_prog_free_id from __bpf_prog_offload_destroy which
> > tries to make offloaded program disappear from the idr when the netdev
> > goes offline. So I'm assuming that '!prog->aux->id' check in bpf_prog_free_id
> > is to handle that case where we do bpf_prog_free_id much earlier than the
> > rest of the __bpf_prog_put stuff.
> >
> >> Maybe just move bpf_prog_free_id() into bpf_prog_put_deferred()
> >> after perf_event_bpf_event and bpf_audit_prog ?
> >> Probably can remove the obsolete do_idr_lock bool flag as
> >> separate patch?
> >
> > +1 on removing do_idr_lock separately.
> >
> >> Much simpler fix and no code churn.
> >> Both valid_id and saved_id approaches have flaws.
> >
> > Given the __bpf_prog_offload_destroy path above, we still probably need
> > some flag to indicate that the id has been already removed from the idr?
>
> So what do you guys want in a patch?  Is there a consensus on what you
> would merge to fix this bug/regression?

Can we try the following?

1. Remove calls to bpf_prog_free_id (and bpf_map_free_id?) from
kernel/bpf/offload.c; that should make it easier to reason about those
'!id' checks
2. Move bpf_prog_free_id (and bpf_map_free_id?) to happen after
audit/perf in kernel/bpf/syscall.c (there are comments that say "must
be called first", but I don't see why; seems like GET_FD_BY_ID would
correctly return -ENOENT; maybe Martin can chime in, CC'ed him
explicitly)
3. (optionally) Remove do_idr_lock arguments (all callers are passing 'true')

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

