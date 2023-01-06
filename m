Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1282466077D
	for <lists+linux-audit@lfdr.de>; Fri,  6 Jan 2023 20:58:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673035119;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z/oHo02YEUWu/v7NcgJuu1ldmMLr69j6pvQ94Yb6Heg=;
	b=J7idiIIjJO6+ynzmVViVZMAs9I6iuELOLhTlGzEbfC16xS3uG3m+MoYzRvob/EXCQiuOy0
	TMhuqDMEOPseVHvrJdyUn2qWkQbJtnbxWyXMJH2mNZ/uZ4DpIJ4dDpNx0JumnGzoDk5m//
	85y8WACFkPIOB6+c+giA94tm4FPSD9o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-7bwvxfWmOli1ho3EabgHFA-1; Fri, 06 Jan 2023 14:58:37 -0500
X-MC-Unique: 7bwvxfWmOli1ho3EabgHFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E7B91C0A599;
	Fri,  6 Jan 2023 19:58:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 878DF2166B37;
	Fri,  6 Jan 2023 19:58:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9282F19459E4;
	Fri,  6 Jan 2023 19:58:27 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C31C3194707F for <linux-audit@listman.corp.redhat.com>;
 Fri,  6 Jan 2023 19:45:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AEB30492B01; Fri,  6 Jan 2023 19:45:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7BDE492B00
 for <linux-audit@redhat.com>; Fri,  6 Jan 2023 19:45:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DFFE29AA3AC
 for <linux-audit@redhat.com>; Fri,  6 Jan 2023 19:45:45 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-eJj9ooAXPcm_nLLteKcV7A-1; Fri, 06 Jan 2023 14:45:42 -0500
X-MC-Unique: eJj9ooAXPcm_nLLteKcV7A-1
Received: by mail-pj1-f42.google.com with SMTP id
 l1-20020a17090a384100b00226f05b9595so776952pjf.0
 for <linux-audit@redhat.com>; Fri, 06 Jan 2023 11:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UL/gZX7lFLKx3GMDq4Xe8lHpVhl3DvS0+DdhugdlYL0=;
 b=m7VEn4Q/JZywli8RNaBIfeDMp3ftPOTFewczLLUCXU0jl8boKUTJqAWIwh88IT4kyr
 dm8nNObmeNOTcBJq+BuDzjIYwGWLq5nGushKHPAQ+qdVHvs2jItqiHI7pdCSFAHVURqx
 ZoKUOLRugZYL1vNCrDxZuLKocq5DLykLP66VBF6E4Cr9WNkCfjn/qoPc5TctwDyR+Bmr
 SJlX8fhl6pIIGLLBv9mRhwi+gSGV2234kLht36wi3Z7ZIAJSuvsBdFfOgX9pwVWlHATA
 v27KE2LNyH1vht7TzqN3LKOeB8rChuArLkLznIiWv2CDTaqjA4StvhXHRiRRfaaGAtS/
 lYLA==
X-Gm-Message-State: AFqh2kqVS/6kVURi+5msuiW6EZg9T8S9bhPoeRX+ZspYpMII/HiEkqdP
 yaPDYgykE+O5NJ3tI9XsD/Ri9VjmXAPuoiT2JLQz7w==
X-Google-Smtp-Source: AMrXdXvZk+D/eAuuOVKWJEp0kfGRFlSmVOvJLa6TDu0N3/23vRIYKC/RldJpNY8oeOe+faA6+hpwKQGOoRDD72RDw7g=
X-Received: by 2002:a17:902:a506:b0:189:97e2:ab8b with SMTP id
 s6-20020a170902a50600b0018997e2ab8bmr5657246plq.131.1673034341447; Fri, 06
 Jan 2023 11:45:41 -0800 (PST)
MIME-Version: 1.0
References: <20230106154400.74211-1-paul@paul-moore.com>
 <20230106154400.74211-2-paul@paul-moore.com>
In-Reply-To: <20230106154400.74211-2-paul@paul-moore.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Fri, 6 Jan 2023 11:45:30 -0800
Message-ID: <CAKH8qBtr3A+EH2J6DCaVbgoGMetKbLUOQ8ZF=cJSFd8ym-0vxw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] bpf: remove the do_idr_lock parameter from
 bpf_prog_free_id()
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Fri, 06 Jan 2023 19:58:25 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 6, 2023 at 7:44 AM Paul Moore <paul@paul-moore.com> wrote:
>
> It was determined that the do_idr_lock parameter to
> bpf_prog_free_id() was not necessary as it should always be true.
>
> Suggested-by: Stanislav Fomichev <sdf@google.com>

nit: I believe it's been suggested several times by different people

Acked-by: Stanislav Fomichev <sdf@google.com>


> Signed-off-by: Paul Moore <paul@paul-moore.com>
>
> ---
> * v3
> - initial draft
> ---
>  include/linux/bpf.h  |  2 +-
>  kernel/bpf/syscall.c | 20 ++++++--------------
>  2 files changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 3de24cfb7a3d..634d37a599fa 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1832,7 +1832,7 @@ void bpf_prog_inc(struct bpf_prog *prog);
>  struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
>  void bpf_prog_put(struct bpf_prog *prog);
>
> -void bpf_prog_free_id(struct bpf_prog *prog, bool do_idr_lock);
> +void bpf_prog_free_id(struct bpf_prog *prog);
>  void bpf_map_free_id(struct bpf_map *map, bool do_idr_lock);
>
>  struct btf_field *btf_record_find(const struct btf_record *rec,
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 61bb19e81b9c..ecca9366c7a6 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -2001,7 +2001,7 @@ static int bpf_prog_alloc_id(struct bpf_prog *prog)
>         return id > 0 ? 0 : id;
>  }
>
> -void bpf_prog_free_id(struct bpf_prog *prog, bool do_idr_lock)
> +void bpf_prog_free_id(struct bpf_prog *prog)
>  {
>         unsigned long flags;
>
> @@ -2013,18 +2013,10 @@ void bpf_prog_free_id(struct bpf_prog *prog, bool do_idr_lock)
>         if (!prog->aux->id)
>                 return;
>
> -       if (do_idr_lock)
> -               spin_lock_irqsave(&prog_idr_lock, flags);
> -       else
> -               __acquire(&prog_idr_lock);
> -
> +       spin_lock_irqsave(&prog_idr_lock, flags);
>         idr_remove(&prog_idr, prog->aux->id);
>         prog->aux->id = 0;
> -
> -       if (do_idr_lock)
> -               spin_unlock_irqrestore(&prog_idr_lock, flags);
> -       else
> -               __release(&prog_idr_lock);
> +       spin_unlock_irqrestore(&prog_idr_lock, flags);
>  }
>
>  static void __bpf_prog_put_rcu(struct rcu_head *rcu)
> @@ -2067,11 +2059,11 @@ static void bpf_prog_put_deferred(struct work_struct *work)
>         prog = aux->prog;
>         perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_UNLOAD, 0);
>         bpf_audit_prog(prog, BPF_AUDIT_UNLOAD);
> -       bpf_prog_free_id(prog, true);
> +       bpf_prog_free_id(prog);
>         __bpf_prog_put_noref(prog, true);
>  }
>
> -static void __bpf_prog_put(struct bpf_prog *prog, bool do_idr_lock)
> +static void __bpf_prog_put(struct bpf_prog *prog)
>  {
>         struct bpf_prog_aux *aux = prog->aux;
>
> @@ -2087,7 +2079,7 @@ static void __bpf_prog_put(struct bpf_prog *prog, bool do_idr_lock)
>
>  void bpf_prog_put(struct bpf_prog *prog)
>  {
> -       __bpf_prog_put(prog, true);
> +       __bpf_prog_put(prog);
>  }
>  EXPORT_SYMBOL_GPL(bpf_prog_put);
>
> --
> 2.39.0
>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

