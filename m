Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20117651588
	for <lists+linux-audit@lfdr.de>; Mon, 19 Dec 2022 23:24:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671488693;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FuiIFrH6la18o3mu1oB6in2wGhFRMydt8w/BiScV4f4=;
	b=HRXNqwuIj4HRAq2sTXqQ/IX45Kyf1RsUcezVfClzth1bGjQufHn+o0qkvJBPeohyDaaydX
	5QLT2MzVYCnzjcjZ1wGL7i5TJOdVkHWxJnqvnlOHDG6sf6gLb7VDovlNR1ZmRwz34ihU96
	vO/QH7k51heD7tpvjJayxkmnaEVLIIw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-Zr2M5vuFN3ybA2GSoo7seg-1; Mon, 19 Dec 2022 17:24:51 -0500
X-MC-Unique: Zr2M5vuFN3ybA2GSoo7seg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06030887403;
	Mon, 19 Dec 2022 22:24:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2515492C14;
	Mon, 19 Dec 2022 22:24:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AC1D519465A2;
	Mon, 19 Dec 2022 22:24:47 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3DA10194658D for <linux-audit@listman.corp.redhat.com>;
 Mon, 19 Dec 2022 22:24:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E7DFE1121315; Mon, 19 Dec 2022 22:24:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF9BC1121314
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 22:24:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C06E52A5956B
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 22:24:45 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-NGPQs0DcNxK3N0T0ZnHzHg-1; Mon, 19 Dec 2022 17:24:42 -0500
X-MC-Unique: NGPQs0DcNxK3N0T0ZnHzHg-1
Received: by mail-pj1-f41.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so10261564pjo.3
 for <linux-audit@redhat.com>; Mon, 19 Dec 2022 14:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VAT/DeU4WF68oq7nSs81RA7o2EbEGc7CyHhB3lQLXe4=;
 b=zqSWlNr6y1vprMYsbk9BJ3MJNSFj6u/D8ZPlVE4oeqruARTdCXZhjW2XmR7rodUdP4
 QLAG4z4HtX3G39HasosJmcsEM2nTV3K9kxtYBVSGEj4w4jcrKDitExhYFYkTX6EjN2Vl
 KMwyM4qfvZizn8tiO1AVe5ulD0QUvFJcRXD8v/W8XtUK8iS03wS7QgvsKYXYr5Uce5tv
 v5XDiX0KkzRRFVIZDQkeqRCLpL76mSpSg0jlVDHcdYM3b3zQ4dOttjOU1gNlhAu040I0
 k+Lbmb2427lZjzVdZptl3nrZt+kVthx5snG1sJlkbW8VRjh88kcDyXkpwdpDHvQx9GmR
 idEg==
X-Gm-Message-State: AFqh2krhKTpoDaEOvKjtQcrL0aPkzLuWwzwAq65pb79UvwuCNM1AgZhE
 sQ17z03FIpWLgIyd7AglB3Fw0K5VVOqpCwWS53rW
X-Google-Smtp-Source: AMrXdXsgvCSuQsV5A3IA7e2nywnPvULN+JePYCpJFFzRUH/F9wNdmrLucNJ4UzmtEMrD+9wKjOAcEMhqw357dWJmEM0=
X-Received: by 2002:a17:90a:6481:b0:221:5597:5de7 with SMTP id
 h1-20020a17090a648100b0022155975de7mr1623054pjj.147.1671488680853; Mon, 19
 Dec 2022 14:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20221219175449.1657640-1-omosnace@redhat.com>
 <20221219175449.1657640-2-omosnace@redhat.com>
 <fae32a51-d422-d3ea-0bee-6223ca2cf902@schaufler-ca.com>
In-Reply-To: <fae32a51-d422-d3ea-0bee-6223ca2cf902@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 19 Dec 2022 17:24:29 -0500
Message-ID: <CAHC9VhT8TiEFPBFeRXzE6qCyyXjL4rtQc7=iJ+AqeBkkfgw-mA@mail.gmail.com>
Subject: Re: [PATCH 1/2] audit: introduce a struct to represent an audit
 timestamp
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>,
 selinux@vger.kernel.org, Peter Enderborg <peter.enderborg@sony.com>,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 Zdenek Pytela <zpytela@redhat.com>, Michal Sekletar <msekleta@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 19, 2022 at 1:47 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 12/19/2022 9:54 AM, Ondrej Mosnacek wrote:
> > Join the two fields that comprise an audit timestamp into a common
> > structure. This will be used further in later commits.
>
> Patch 30/39 of my LSM stacking patchset[1] is almost identical to this.
> The only significant difference is the structure name. You use audit_timestamp
> whereas I use audit_stamp. I believe that audit_stamp is more correct and
> more consistent with the code that uses it.
>
> [1] https://lore.kernel.org/lkml/f6b8ac05-6900-f57d-0daf-02d5ae53bc47@schaufler-ca.com/T/#m3205b98b2a6b21a296fb831ed35892f01ead191f

For the record, if "audit_stamp" and "audit_timestamp" are my only two
options I prefer "audit_stamp" simply because it is shorter :)

That said, see my comments on patch 2/2.  While an audit timestamp
struct improvement such as is proposed here and in the LSM stacking
patchset is fine, I'm not in favor of exposing the audit timestamp
outside the audit subsystem.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

