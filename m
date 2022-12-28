Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8CE65861C
	for <lists+linux-audit@lfdr.de>; Wed, 28 Dec 2022 19:55:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672253737;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B493pZfJUROYkiFsffHzliGrLNwBzyHR6zyTHS9U5rM=;
	b=gLX8ES4v4X2or+eJjcAytjrOmWua1/PYCalsladJn61mgLmm4wIQMv/tjLcjn6bjydrw3D
	x4l4wUVz5PgzmAp1PMF+iH4rX/fx4j3d62AbKRvezuUOQET5Cd0QSmu0LmC1sTKmoc4snl
	I6Tn/CYJILazw16fLpWgnkZvsHJAjEg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-FWMXzDZHPZ2a5IZyNDHXiw-1; Wed, 28 Dec 2022 13:55:36 -0500
X-MC-Unique: FWMXzDZHPZ2a5IZyNDHXiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 133F51C06908;
	Wed, 28 Dec 2022 18:55:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFB3B51E5;
	Wed, 28 Dec 2022 18:55:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9CF6A19465B2;
	Wed, 28 Dec 2022 18:55:24 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C23F31946586 for <linux-audit@listman.corp.redhat.com>;
 Wed, 28 Dec 2022 00:30:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9F98D2026D68; Wed, 28 Dec 2022 00:30:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97D8E2026D4B
 for <linux-audit@redhat.com>; Wed, 28 Dec 2022 00:30:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EE091C05AFC
 for <linux-audit@redhat.com>; Wed, 28 Dec 2022 00:30:58 +0000 (UTC)
Received: from forward104o.mail.yandex.net (forward104o.mail.yandex.net
 [37.140.190.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-KWraU-ZCMba_L1dG4rQLfw-1; Tue, 27 Dec 2022 19:30:56 -0500
X-MC-Unique: KWraU-ZCMba_L1dG4rQLfw-1
Received: from iva1-5283d83ef885.qloud-c.yandex.net
 (iva1-5283d83ef885.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:16a7:0:640:5283:d83e])
 by forward104o.mail.yandex.net (Yandex) with ESMTP id 2C96965D5340;
 Wed, 28 Dec 2022 03:25:13 +0300 (MSK)
Received: by iva1-5283d83ef885.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 8PDo3G7YF0U1-ycBwmhus; Wed, 28 Dec 2022 03:25:12 +0300
X-Yandex-Fwd: 1
From: Stanislav Fomichev <stfomichev@yandex.ru>
To: alexei.starovoitov@gmail.com
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
Date: Tue, 27 Dec 2022 16:25:02 -0800
Message-Id: <20221228002502.3972381-1-stfomichev@yandex.ru>
In-Reply-To: <CAADnVQJSTXOfsEunq=z+8tiQPSHpDmtXX3eP9QcM2QvBefgaag@mail.gmail.com>
References: <CAADnVQJSTXOfsEunq=z+8tiQPSHpDmtXX3eP9QcM2QvBefgaag@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: burn.alting@iinet.net.au, daniel@iogearbox.net, andrii@kernel.org,
 ast@kernel.org, linux-audit@redhat.com, sdf@google.com, jolsa@kernel.org,
 bpf@vger.kernel.org, stfomichev@yandex.ru
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> On Mon, Dec 26, 2022 at 7:35 PM Stanislav Fomichev <stfomichev@yandex.ru> wrote:
> >
> > > On Fri, Dec 23, 2022 at 5:49 PM Stanislav Fomichev <sdf@google.com> wrote:
> > > get_func_ip() */
> > > > > -                               tstamp_type_access:1; /* Accessed __sk_buff->tstamp_type */
> > > > > +                               tstamp_type_access:1, /* Accessed __sk_buff->tstamp_type */
> > > > > +                               valid_id:1; /* Is bpf_prog::aux::__id valid? */
> > > > >         enum bpf_prog_type      type;           /* Type of BPF program */
> > > > >         enum bpf_attach_type    expected_attach_type; /* For some prog types */
> > > > >         u32                     len;            /* Number of filter blocks */
> > > > > @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
> > > > >  struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
> > > > >  void bpf_prog_put(struct bpf_prog *prog);
> > > > >
> > > > > +static inline u32 bpf_prog_get_id(const struct bpf_prog *prog)
> > > > > +{
> > > > > +       if (WARN(!prog->valid_id, "Attempting to use an invalid eBPF program"))
> > > > > +               return 0;
> > > > > +       return prog->aux->__id;
> > > > > +}
> > > >
> > > > I'm still missing why we need to have this WARN and have a check at all.
> > > > IIUC, we're actually too eager in resetting the id to 0, and need to
> > > > keep that stale id around at least for perf/audit.
> > > > Why not have a flag only to protect against double-idr_remove
> > > > bpf_prog_free_id and keep the rest as is?
> > > > Which places are we concerned about that used to report id=0 but now
> > > > would report stale id?
> > >
> > > What double-idr_remove are you concerned about?
> > > bpf_prog_by_id() is doing bpf_prog_inc_not_zero
> > > while __bpf_prog_put just dropped it to zero.
> >
> > (traveling, sending from an untested setup, hope it reaches everyone)
> >
> > There is a call to bpf_prog_free_id from __bpf_prog_offload_destroy which
> > tries to make offloaded program disappear from the idr when the netdev
> > goes offline. So I'm assuming that '!prog->aux->id' check in bpf_prog_free_id
> > is to handle that case where we do bpf_prog_free_id much earlier than the
> > rest of the __bpf_prog_put stuff.
> 
> That remove was done in
> commit ad8ad79f4f60 ("bpf: offload: free program id when device disappears")
> Back in 2017 there was no bpf audit and no
> PERF_BPF_EVENT_PROG_LOAD/UNLOAD events.
> 
> The removal of id made sense back then to avoid showing this
> 'useless' orphaned offloaded prog in 'bpftool prog show',
> but with addition of perf load/unload and audit it was no longer
> correct to zero out ID in a prog which refcnt is still not zero.
> 
> So we should simply remove bpf_prog_free_id from __bpf_prog_offload_destroy.
> There won't be any adverse effect other than bpftool prog show
> will show orphaned progs.

SGTM, that would simplify everything..

> >
> > > Maybe just move bpf_prog_free_id() into bpf_prog_put_deferred()
> > > after perf_event_bpf_event and bpf_audit_prog ?
> > > Probably can remove the obsolete do_idr_lock bool flag as
> > > separate patch?
> >
> > +1 on removing do_idr_lock separately.
> >
> > > Much simpler fix and no code churn.
> > > Both valid_id and saved_id approaches have flaws.
> >
> > Given the __bpf_prog_offload_destroy path above, we still probably need
> > some flag to indicate that the id has been already removed from the idr?
> 
> No. ID should be valid until prog went through perf and audit unload
> events. Don't know about audit, but for perf it's essential to have
> valid ID otherwise perf record will not be able to properly associate events.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

