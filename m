Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D8665861B
	for <lists+linux-audit@lfdr.de>; Wed, 28 Dec 2022 19:55:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672253737;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2dJjvdueEw1eL8YkfxziVWENrMnnjbHVIvHjSnQg3IQ=;
	b=G9tctkCecVe2BvuW49GiFpnaX5zyHM316bVVOr8TbpYyDkBi1L3qvdGQjrAmL3vpX55Bmn
	oGXKdo/weBwg4nDnmmZp/DHl/ccpV0w3LfOhdGUs29M64u3eurlN3aRCjdqGi1XaE9A8YS
	5uZt5dVxJ/91InzE+FugOOKGunfERKI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-vigAb9XbOSaVRsod2fkEkg-1; Wed, 28 Dec 2022 13:55:35 -0500
X-MC-Unique: vigAb9XbOSaVRsod2fkEkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1205938041CF;
	Wed, 28 Dec 2022 18:55:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C094A112132D;
	Wed, 28 Dec 2022 18:55:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 578BC1946595;
	Wed, 28 Dec 2022 18:55:22 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 23ECC1946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Dec 2022 17:49:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C2C0A492B01; Tue, 27 Dec 2022 17:49:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB901492B00
 for <linux-audit@redhat.com>; Tue, 27 Dec 2022 17:49:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A18902A59541
 for <linux-audit@redhat.com>; Tue, 27 Dec 2022 17:49:22 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-186-tMhxreDXNBav9_EIQAGFKg-1; Tue, 27 Dec 2022 12:49:18 -0500
X-MC-Unique: tMhxreDXNBav9_EIQAGFKg-1
Received: by mail-ej1-f47.google.com with SMTP id ud5so33440773ejc.4
 for <linux-audit@redhat.com>; Tue, 27 Dec 2022 09:49:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EM8myhgzIl/hLVzBEkZldw4FFb+SHfO1TYtufJ5NHAk=;
 b=NzNpJAUcBnqcZ7Yb5PdgjYcgk0MSMsKaWGPxOJqmB57Wa+rzdFi69A/2eUg4IbG+JH
 9t3VnGovzntQZwMntOcCaWNlgDZG8wLxtUJm67N4UMOIkwImyp8ERG+si5S7BTZkrWQz
 XyxlZjci4aY+iXBDoRqUUv0I4IwmoeGvFyC1ClZlrWz0e3I8+X5NzkXsVEQCezkezhC2
 EIdYUO8O1pJ5y5U53Q22q1N9n0d3N63sZzhM3jA87NKxLZf81HF8/yWJY+ltTRv8q88y
 FC+FK8ICrTRnd3OtR71m+3Ytms+7hQ8sWFpte+i0cUgRyB4jxLEsmLNhfdk/o1MHOgvT
 3Jcg==
X-Gm-Message-State: AFqh2kqdv2poLQLALc2tYvSpVQCDx36kGp1bjw5DXGVjG6NqbHRfmNNh
 5j7G/wq0pHSb9yDxHtO0O65f7wsdo2H7MldvfG8=
X-Google-Smtp-Source: AMrXdXsRjoR1peXlyKN5/KXCONx5ogElWj8fOPx5atJaDb4nzV45m768fZI9LTRwdk6jtKN5Aa5/r3Dju6ll5bqqN7c=
X-Received: by 2002:a17:906:a18c:b0:7c0:f2cf:3515 with SMTP id
 s12-20020a170906a18c00b007c0f2cf3515mr1482742ejy.327.1672163357184; Tue, 27
 Dec 2022 09:49:17 -0800 (PST)
MIME-Version: 1.0
References: <CAADnVQ+pgN8m3ApZtk9Vr=iv+OcXcv5hhASCwP6ZJGt9Z2JvMw@mail.gmail.com>
 <20221227033528.1032724-1-stfomichev@yandex.ru>
In-Reply-To: <20221227033528.1032724-1-stfomichev@yandex.ru>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 27 Dec 2022 09:49:05 -0800
Message-ID: <CAADnVQJSTXOfsEunq=z+8tiQPSHpDmtXX3eP9QcM2QvBefgaag@mail.gmail.com>
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
To: Stanislav Fomichev <stfomichev@yandex.ru>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Wed, 28 Dec 2022 18:55:06 +0000
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
Cc: Burn Alting <burn.alting@iinet.net.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, linux-audit@redhat.com,
 Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf <bpf@vger.kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 26, 2022 at 7:35 PM Stanislav Fomichev <stfomichev@yandex.ru> wrote:
>
> > On Fri, Dec 23, 2022 at 5:49 PM Stanislav Fomichev <sdf@google.com> wrote:
> > get_func_ip() */
> > > > -                               tstamp_type_access:1; /* Accessed __sk_buff->tstamp_type */
> > > > +                               tstamp_type_access:1, /* Accessed __sk_buff->tstamp_type */
> > > > +                               valid_id:1; /* Is bpf_prog::aux::__id valid? */
> > > >         enum bpf_prog_type      type;           /* Type of BPF program */
> > > >         enum bpf_attach_type    expected_attach_type; /* For some prog types */
> > > >         u32                     len;            /* Number of filter blocks */
> > > > @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
> > > >  struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
> > > >  void bpf_prog_put(struct bpf_prog *prog);
> > > >
> > > > +static inline u32 bpf_prog_get_id(const struct bpf_prog *prog)
> > > > +{
> > > > +       if (WARN(!prog->valid_id, "Attempting to use an invalid eBPF program"))
> > > > +               return 0;
> > > > +       return prog->aux->__id;
> > > > +}
> > >
> > > I'm still missing why we need to have this WARN and have a check at all.
> > > IIUC, we're actually too eager in resetting the id to 0, and need to
> > > keep that stale id around at least for perf/audit.
> > > Why not have a flag only to protect against double-idr_remove
> > > bpf_prog_free_id and keep the rest as is?
> > > Which places are we concerned about that used to report id=0 but now
> > > would report stale id?
> >
> > What double-idr_remove are you concerned about?
> > bpf_prog_by_id() is doing bpf_prog_inc_not_zero
> > while __bpf_prog_put just dropped it to zero.
>
> (traveling, sending from an untested setup, hope it reaches everyone)
>
> There is a call to bpf_prog_free_id from __bpf_prog_offload_destroy which
> tries to make offloaded program disappear from the idr when the netdev
> goes offline. So I'm assuming that '!prog->aux->id' check in bpf_prog_free_id
> is to handle that case where we do bpf_prog_free_id much earlier than the
> rest of the __bpf_prog_put stuff.

That remove was done in
commit ad8ad79f4f60 ("bpf: offload: free program id when device disappears")
Back in 2017 there was no bpf audit and no
PERF_BPF_EVENT_PROG_LOAD/UNLOAD events.

The removal of id made sense back then to avoid showing this
'useless' orphaned offloaded prog in 'bpftool prog show',
but with addition of perf load/unload and audit it was no longer
correct to zero out ID in a prog which refcnt is still not zero.

So we should simply remove bpf_prog_free_id from __bpf_prog_offload_destroy.
There won't be any adverse effect other than bpftool prog show
will show orphaned progs.

>
> > Maybe just move bpf_prog_free_id() into bpf_prog_put_deferred()
> > after perf_event_bpf_event and bpf_audit_prog ?
> > Probably can remove the obsolete do_idr_lock bool flag as
> > separate patch?
>
> +1 on removing do_idr_lock separately.
>
> > Much simpler fix and no code churn.
> > Both valid_id and saved_id approaches have flaws.
>
> Given the __bpf_prog_offload_destroy path above, we still probably need
> some flag to indicate that the id has been already removed from the idr?

No. ID should be valid until prog went through perf and audit unload
events. Don't know about audit, but for perf it's essential to have
valid ID otherwise perf record will not be able to properly associate events.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

