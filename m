Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 708ED6603A6
	for <lists+linux-audit@lfdr.de>; Fri,  6 Jan 2023 16:44:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673019881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s3nNw7+tMdO9Gcl65a8JNiLMPVNmZk6saPv+yiP2ZOk=;
	b=enLyjRGhbW8OCJNSyzB5foTKI9b1Ca9Uw5O5slsL/C1weJPoHbsT0xsxe/4niepTg9+XFb
	ibGMNqJ/pHbFIL+GFDWKQZAQVK69MaQfEopptbB1jtmjQI68SrpvY1gdDMKl8Alqcmh2V2
	4zou7KS5fBUtfNijDCwIn2Z1tOfVHXs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-MRoZBOVvPs64X4OJtNhh-A-1; Fri, 06 Jan 2023 10:44:39 -0500
X-MC-Unique: MRoZBOVvPs64X4OJtNhh-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F92E1C0514F;
	Fri,  6 Jan 2023 15:44:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 445672026D68;
	Fri,  6 Jan 2023 15:44:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9BE941947072;
	Fri,  6 Jan 2023 15:44:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AC8D51946586 for <linux-audit@listman.corp.redhat.com>;
 Fri,  6 Jan 2023 15:44:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ACEA7492B01; Fri,  6 Jan 2023 15:44:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5DEA492B00
 for <linux-audit@redhat.com>; Fri,  6 Jan 2023 15:44:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85D373C0F683
 for <linux-audit@redhat.com>; Fri,  6 Jan 2023 15:44:11 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-u7MgemTXOty-MtbEimtvtg-1; Fri, 06 Jan 2023 10:44:04 -0500
X-MC-Unique: u7MgemTXOty-MtbEimtvtg-1
Received: by mail-vs1-f51.google.com with SMTP id o63so1797731vsc.10
 for <linux-audit@redhat.com>; Fri, 06 Jan 2023 07:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fd5JRFn3Cr5IWNkuRQ9nibDUI9vKExSd4SCBuH3OmNw=;
 b=CJ9++RtY2JHyymGBYXvWNpFOwG9mMJQLeqCtJOCa8hfyiW1z0aDIxWomleFdAUOZgR
 1XBvFYCzzW1RRIYJKHuIm8jmXuAH35BNY1L/8w/DeBakkPdFQCERGWeW5vDCraAzPFjl
 OVIW1Isk5ekuqT3CNrYdUZ+3FcSygBDhYy+h8647+qYgofCHOifd7nV35D6REg02t60T
 UmRGz+PEUTy61YW3DbYMYECOaIvw6A0GGuN+4SgK4+wCGC4GeHbEFga9/JKgOdlrPGBp
 hzy3pHGl+rAL+dmb0XR6mmduMzYtt6PY7T9WhoUfKabak4Ga9qinYvifaU/QV/9E1rto
 pwtA==
X-Gm-Message-State: AFqh2kqSZlOq6yBszl379+OsWPlXq7WAlwmvyWyxugzUsZz9fLUwQ8lD
 ipYJqrPMvS0zKHim/Siu+5dSlIMfpvEDkcI=
X-Google-Smtp-Source: AMrXdXs8rijHgVUdSfFZAXBKIH6T7FgQK3p9S5Uiy+/kLe4hL1kOCqS28Jglq6Smsm8NfhFBWxp6fA==
X-Received: by 2002:a67:fe8c:0:b0:3cc:fb78:e403 with SMTP id
 b12-20020a67fe8c000000b003ccfb78e403mr13173588vsr.10.1673019843168; 
 Fri, 06 Jan 2023 07:44:03 -0800 (PST)
Received: from localhost (pool-108-26-161-203.bstnma.fios.verizon.net.
 [108.26.161.203]) by smtp.gmail.com with ESMTPSA id
 w19-20020a05620a445300b006fc3fa1f589sm678167qkp.114.2023.01.06.07.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 07:44:02 -0800 (PST)
From: Paul Moore <paul@paul-moore.com>
To: linux-audit@redhat.com,
	bpf@vger.kernel.org
Subject: [PATCH v3 2/2] bpf: remove the do_idr_lock parameter from
 bpf_prog_free_id()
Date: Fri,  6 Jan 2023 10:44:00 -0500
Message-Id: <20230106154400.74211-2-paul@paul-moore.com>
In-Reply-To: <20230106154400.74211-1-paul@paul-moore.com>
References: <20230106154400.74211-1-paul@paul-moore.com>
MIME-Version: 1.0
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
Cc: Burn Alting <burn.alting@iinet.net.au>, Stanislav Fomichev <sdf@google.com>,
 Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It was determined that the do_idr_lock parameter to
bpf_prog_free_id() was not necessary as it should always be true.

Suggested-by: Stanislav Fomichev <sdf@google.com>
Signed-off-by: Paul Moore <paul@paul-moore.com>

---
* v3
- initial draft
---
 include/linux/bpf.h  |  2 +-
 kernel/bpf/syscall.c | 20 ++++++--------------
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 3de24cfb7a3d..634d37a599fa 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1832,7 +1832,7 @@ void bpf_prog_inc(struct bpf_prog *prog);
 struct bpf_prog * __must_check bpf_prog_inc_not_zero(struct bpf_prog *prog);
 void bpf_prog_put(struct bpf_prog *prog);
 
-void bpf_prog_free_id(struct bpf_prog *prog, bool do_idr_lock);
+void bpf_prog_free_id(struct bpf_prog *prog);
 void bpf_map_free_id(struct bpf_map *map, bool do_idr_lock);
 
 struct btf_field *btf_record_find(const struct btf_record *rec,
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 61bb19e81b9c..ecca9366c7a6 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -2001,7 +2001,7 @@ static int bpf_prog_alloc_id(struct bpf_prog *prog)
 	return id > 0 ? 0 : id;
 }
 
-void bpf_prog_free_id(struct bpf_prog *prog, bool do_idr_lock)
+void bpf_prog_free_id(struct bpf_prog *prog)
 {
 	unsigned long flags;
 
@@ -2013,18 +2013,10 @@ void bpf_prog_free_id(struct bpf_prog *prog, bool do_idr_lock)
 	if (!prog->aux->id)
 		return;
 
-	if (do_idr_lock)
-		spin_lock_irqsave(&prog_idr_lock, flags);
-	else
-		__acquire(&prog_idr_lock);
-
+	spin_lock_irqsave(&prog_idr_lock, flags);
 	idr_remove(&prog_idr, prog->aux->id);
 	prog->aux->id = 0;
-
-	if (do_idr_lock)
-		spin_unlock_irqrestore(&prog_idr_lock, flags);
-	else
-		__release(&prog_idr_lock);
+	spin_unlock_irqrestore(&prog_idr_lock, flags);
 }
 
 static void __bpf_prog_put_rcu(struct rcu_head *rcu)
@@ -2067,11 +2059,11 @@ static void bpf_prog_put_deferred(struct work_struct *work)
 	prog = aux->prog;
 	perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_UNLOAD, 0);
 	bpf_audit_prog(prog, BPF_AUDIT_UNLOAD);
-	bpf_prog_free_id(prog, true);
+	bpf_prog_free_id(prog);
 	__bpf_prog_put_noref(prog, true);
 }
 
-static void __bpf_prog_put(struct bpf_prog *prog, bool do_idr_lock)
+static void __bpf_prog_put(struct bpf_prog *prog)
 {
 	struct bpf_prog_aux *aux = prog->aux;
 
@@ -2087,7 +2079,7 @@ static void __bpf_prog_put(struct bpf_prog *prog, bool do_idr_lock)
 
 void bpf_prog_put(struct bpf_prog *prog)
 {
-	__bpf_prog_put(prog, true);
+	__bpf_prog_put(prog);
 }
 EXPORT_SYMBOL_GPL(bpf_prog_put);
 
-- 
2.39.0

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

