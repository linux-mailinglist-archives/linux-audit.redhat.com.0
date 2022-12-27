Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCB065863B
	for <lists+linux-audit@lfdr.de>; Wed, 28 Dec 2022 20:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672254406;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZHPt/ofNld/VQ1AvU+ULvgs7APZ2U9WDvEPanbr054I=;
	b=MQ+Spw4frZa0MW3DXfq6IAq4NqQfvv7J4ynU4deyLFuH08YbTFk058dXBMzW7RzRiPauJ/
	Bs/50SUpozbDjDEqZW+J154hmHBD8qZf+i8SKVWN1Hfr+d26pXKwvppdee/8rYnGCe2nBG
	WmDJWqpfnstxc5s6y2ss1pvC/6ya1xc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-yhkqCCLdNGOE8I3wtsXkdg-1; Wed, 28 Dec 2022 14:06:44 -0500
X-MC-Unique: yhkqCCLdNGOE8I3wtsXkdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E5E0811E6E;
	Wed, 28 Dec 2022 19:06:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5579140AE1E9;
	Wed, 28 Dec 2022 19:06:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E13571946595;
	Wed, 28 Dec 2022 19:06:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A66421946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 27 Dec 2022 03:41:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 896C72166B40; Tue, 27 Dec 2022 03:41:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82C342166B3F
 for <linux-audit@redhat.com>; Tue, 27 Dec 2022 03:41:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 637F3101A521
 for <linux-audit@redhat.com>; Tue, 27 Dec 2022 03:41:55 +0000 (UTC)
Received: from forward502b.mail.yandex.net (forward502b.mail.yandex.net
 [178.154.239.146]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-385-P4ye739PPY-TeMuikIEj8A-1; Mon, 26 Dec 2022 22:41:48 -0500
X-MC-Unique: P4ye739PPY-TeMuikIEj8A-1
Received: from myt6-fe378243d6ea.qloud-c.yandex.net
 (myt6-fe378243d6ea.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:488f:0:640:fe37:8243])
 by forward502b.mail.yandex.net (Yandex) with ESMTP id 4E2925ED86;
 Tue, 27 Dec 2022 06:35:42 +0300 (MSK)
Received: by myt6-fe378243d6ea.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id cZFOuGaZRGk1-4hXo2Qzg; Tue, 27 Dec 2022 06:35:41 +0300
X-Yandex-Fwd: 1
From: Stanislav Fomichev <stfomichev@yandex.ru>
To: alexei.starovoitov@gmail.com
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD
 and PERF_BPF_EVENT_PROG_UNLOAD
Date: Mon, 26 Dec 2022 19:35:28 -0800
Message-Id: <20221227033528.1032724-1-stfomichev@yandex.ru>
In-Reply-To: <CAADnVQ+pgN8m3ApZtk9Vr=iv+OcXcv5hhASCwP6ZJGt9Z2JvMw@mail.gmail.com>
References: <CAADnVQ+pgN8m3ApZtk9Vr=iv+OcXcv5hhASCwP6ZJGt9Z2JvMw@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
 bpf@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> On Fri, Dec 23, 2022 at 5:49 PM Stanislav Fomichev <sdf@google.com> wrote:
> get_func_ip() */
> > > -                               tstamp_type_access:1; /* Accessed __sk_buff->tstamp_type */
> > > +                               tstamp_type_access:1, /* Accessed __sk_buff->tstamp_type */
> > > +                               valid_id:1; /* Is bpf_prog::aux::__id valid? */
> > >         enum bpf_prog_type      type;           /* Type of BPF program */
> > >         enum bpf_attach_type    expected_attach_type; /* For some prog types */
> > >         u32                     len;            /* Number of filter blocks */
> > > @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
> > >  struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
> > >  void bpf_prog_put(struct bpf_prog *prog);
> > >
> > > +static inline u32 bpf_prog_get_id(const struct bpf_prog *prog)
> > > +{
> > > +       if (WARN(!prog->valid_id, "Attempting to use an invalid eBPF program"))
> > > +               return 0;
> > > +       return prog->aux->__id;
> > > +}
> >
> > I'm still missing why we need to have this WARN and have a check at all.
> > IIUC, we're actually too eager in resetting the id to 0, and need to
> > keep that stale id around at least for perf/audit.
> > Why not have a flag only to protect against double-idr_remove
> > bpf_prog_free_id and keep the rest as is?
> > Which places are we concerned about that used to report id=0 but now
> > would report stale id?
> 
> What double-idr_remove are you concerned about?
> bpf_prog_by_id() is doing bpf_prog_inc_not_zero
> while __bpf_prog_put just dropped it to zero.

(traveling, sending from an untested setup, hope it reaches everyone)

There is a call to bpf_prog_free_id from __bpf_prog_offload_destroy which
tries to make offloaded program disappear from the idr when the netdev
goes offline. So I'm assuming that '!prog->aux->id' check in bpf_prog_free_id
is to handle that case where we do bpf_prog_free_id much earlier than the
rest of the __bpf_prog_put stuff.

> Maybe just move bpf_prog_free_id() into bpf_prog_put_deferred()
> after perf_event_bpf_event and bpf_audit_prog ?
> Probably can remove the obsolete do_idr_lock bool flag as
> separate patch?

+1 on removing do_idr_lock separately.

> Much simpler fix and no code churn.
> Both valid_id and saved_id approaches have flaws.

Given the __bpf_prog_offload_destroy path above, we still probably need
some flag to indicate that the id has been already removed from the idr?

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

