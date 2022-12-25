Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1B065861D
	for <lists+linux-audit@lfdr.de>; Wed, 28 Dec 2022 19:55:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672253738;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eJs4uUs7m/wQkjk08pUXrLutEiaWEhfhZ5KSTwyRcJc=;
	b=MplLovWJ0pphFQJ6iuIKJcsz1mbz13HrbssX6OU1axG/T328xa1P3b+fwO5d1m56aPXLV4
	epDgXGvXtoTQFxrjsWbPuW8tn5Gq4ayaurPGX2/1t5lATgMMxHfQ+CF6idXINUJRmGY9pz
	+EbfKuFqrRrR21V63okFJhw9RC7mAmY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-zRMzAHjeMSWb0E2uaJDJQw-1; Wed, 28 Dec 2022 13:55:35 -0500
X-MC-Unique: zRMzAHjeMSWb0E2uaJDJQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12129101A521;
	Wed, 28 Dec 2022 18:55:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DFB43C15BA0;
	Wed, 28 Dec 2022 18:55:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7A05A19465A2;
	Wed, 28 Dec 2022 18:55:24 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9F0491946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 25 Dec 2022 22:17:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 758322166B34; Sun, 25 Dec 2022 22:17:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E8DA2166B33
 for <linux-audit@redhat.com>; Sun, 25 Dec 2022 22:17:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 517BB85A588
 for <linux-audit@redhat.com>; Sun, 25 Dec 2022 22:17:05 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-426-6KrFcLU1MiihlyCYMOlvLg-1; Sun, 25 Dec 2022 17:17:03 -0500
X-MC-Unique: 6KrFcLU1MiihlyCYMOlvLg-1
Received: by mail-ej1-f52.google.com with SMTP id ud5so23174253ejc.4
 for <linux-audit@redhat.com>; Sun, 25 Dec 2022 14:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k9VYayWhEojXdedhpz0T3pFz3Qk5NlIUSQcAxKCeies=;
 b=xkJ9GURITnN7Xn6d8KQAEfnPD4Y/svXKSY+4skcqGBN6HoFmFXDnDYEYVCRvMyWpaC
 l19u/IZVpAP3UQeNShI2lCnBaGx+UUSgBbzCRs2S5NSwJjrTNlt6wzV7Ul0UC7A2V+2q
 58Qc3tJV8Axaus85vMIuq51Y5+JZe1WhsvAj6MPPQroA+qYpzovA2JLZecdCxIOaWYRF
 c+QPd3n/D8v/tzU+ggEk+VxeaBlZiUh/pInzFpQU2Okw5jZZx6l7vJU+QPtl+XhBCzZ8
 pfo9j+eSijMOnWpKYAT7RNTdLBMSt79EgQHBLPZXWke4Hxm3zQzFsCWb+69nYiOzZzOG
 +VVw==
X-Gm-Message-State: AFqh2kpBWrcUho33wtcJ0OVnXUXcg63/N442G9bIw77SyQCgI0ufXLyc
 lDTedkcY+pQBwNGJjLkmqt/rAtAEarYqlC0ZS/8=
X-Google-Smtp-Source: AMrXdXvj4TjWhrl6oaLRvnCr8CX/yG0bSRHD9hJLWz1fj14bqPQXTUxwsRS32yD+C1byaROl9bcMArcBcwc32oDuHz8=
X-Received: by 2002:a17:906:a18c:b0:7c0:f2cf:3515 with SMTP id
 s12-20020a170906a18c00b007c0f2cf3515mr1075480ejy.327.1672006621737; Sun, 25
 Dec 2022 14:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20221223185531.222689-1-paul@paul-moore.com>
 <CAKH8qBu30bdiMWmUzZsYaVRTpSXfKjeBHD9deSPQmk_v_seDuA@mail.gmail.com>
In-Reply-To: <CAKH8qBu30bdiMWmUzZsYaVRTpSXfKjeBHD9deSPQmk_v_seDuA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 25 Dec 2022 14:16:50 -0800
Message-ID: <CAADnVQ+pgN8m3ApZtk9Vr=iv+OcXcv5hhASCwP6ZJGt9Z2JvMw@mail.gmail.com>
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
Cc: Burn Alting <burn.alting@iinet.net.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, linux-audit@redhat.com,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 23, 2022 at 5:49 PM Stanislav Fomichev <sdf@google.com> wrote:
get_func_ip() */
> > -                               tstamp_type_access:1; /* Accessed __sk_buff->tstamp_type */
> > +                               tstamp_type_access:1, /* Accessed __sk_buff->tstamp_type */
> > +                               valid_id:1; /* Is bpf_prog::aux::__id valid? */
> >         enum bpf_prog_type      type;           /* Type of BPF program */
> >         enum bpf_attach_type    expected_attach_type; /* For some prog types */
> >         u32                     len;            /* Number of filter blocks */
> > @@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);
> >  struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
> >  void bpf_prog_put(struct bpf_prog *prog);
> >
> > +static inline u32 bpf_prog_get_id(const struct bpf_prog *prog)
> > +{
> > +       if (WARN(!prog->valid_id, "Attempting to use an invalid eBPF program"))
> > +               return 0;
> > +       return prog->aux->__id;
> > +}
>
> I'm still missing why we need to have this WARN and have a check at all.
> IIUC, we're actually too eager in resetting the id to 0, and need to
> keep that stale id around at least for perf/audit.
> Why not have a flag only to protect against double-idr_remove
> bpf_prog_free_id and keep the rest as is?
> Which places are we concerned about that used to report id=0 but now
> would report stale id?

What double-idr_remove are you concerned about?
bpf_prog_by_id() is doing bpf_prog_inc_not_zero
while __bpf_prog_put just dropped it to zero.

Maybe just move bpf_prog_free_id() into bpf_prog_put_deferred()
after perf_event_bpf_event and bpf_audit_prog ?
Probably can remove the obsolete do_idr_lock bool flag as
separate patch?

Much simpler fix and no code churn.
Both valid_id and saved_id approaches have flaws.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

