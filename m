Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 164B36C11B9
	for <lists+linux-audit@lfdr.de>; Mon, 20 Mar 2023 13:20:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679314844;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cknC8DpEHI8K5FGO584UGx3AA1vRTNkwpVwACB+9WtI=;
	b=Rn4VbLMb7wN5Z1l31fCbZIMUNRI0baP7/OC1J/pXQsux7FM0gUuAH3SxE6Q2fud73PMDfV
	Uxru77C9XwkiBJHPEmQH+YIYlzlRweJNncEnRyopaDyBGpIFuiln8mKOBIZcCnd4/IWXbT
	EZ7QxEPTZW58mFfK7X59iqShHdvGWJk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-5CoaFfT9NGiyCo3ytZf1Wg-1; Mon, 20 Mar 2023 08:20:41 -0400
X-MC-Unique: 5CoaFfT9NGiyCo3ytZf1Wg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CD1685C064;
	Mon, 20 Mar 2023 12:20:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13E3B492C13;
	Mon, 20 Mar 2023 12:20:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E3E8919465B5;
	Mon, 20 Mar 2023 12:20:31 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B7A1D1946594 for <linux-audit@listman.corp.redhat.com>;
 Mon, 20 Mar 2023 12:20:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6383B2166B2A; Mon, 20 Mar 2023 12:20:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AE462166B29
 for <linux-audit@redhat.com>; Mon, 20 Mar 2023 12:20:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CC7F101A54F
 for <linux-audit@redhat.com>; Mon, 20 Mar 2023 12:20:30 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-yBiUmFcfP2yIPtiK3n5QYw-1; Mon, 20 Mar 2023 08:20:28 -0400
X-MC-Unique: yBiUmFcfP2yIPtiK3n5QYw-1
Received: by mail-ua1-f45.google.com with SMTP id v48so7735696uad.6
 for <Linux-audit@redhat.com>; Mon, 20 Mar 2023 05:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679314828;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F/Qb4QanzyzSeJUfOq4dk0ChgOlodgwuVos2HVYhwvQ=;
 b=HrHphHWuMnO+uKD5Nsmscstu1yHSLwsKtd5q5koym09fXOBJd/uHm7xRrrUIedPSjB
 CS/SjZC/dC3SapupxiBASAWgQMDtHflyRsoD11T7o+4K2hkuQU7YkgBNLV7K/+dbg6R+
 Iwg4DhUcRN4eZ2SjXiZmdMAuxWDBemOXGu+D8tsNok8KX1grZX7qrCi9dseRqAICUA8K
 9Hh3B3kkI2kmfV42gUkSlcJaARso2szlaeihN1Oz2nfSXZ+a7ditMW2spWxR2L1l7+4+
 DmVXGvdtxBApQsqpUBBu2oKAIgXKm3B5h4Dw6hJdPM1fpirr+xwyljQFoTtLgZ7tBa3K
 47VQ==
X-Gm-Message-State: AO0yUKWDs2NHhHxHdkL1v1zSXOTGME6PFH0wcrZcL1XBJ9k2WtvXtVMe
 Mcenz25+Il3x2AZfiWcp/aBMDuvxto4LJyzTqhKOk9gMV60=
X-Google-Smtp-Source: AK7set+5Ofm98Nw1OlTopFElRyFFLE1t4oKimTJiRDLPzuGS/+o6MNLNyPMCXguQVsvKBL/Te18z9qoAyLPzsvU6mwg=
X-Received: by 2002:a1f:17cd:0:b0:435:56e:154e with SMTP id
 196-20020a1f17cd000000b00435056e154emr3768837vkx.1.1679314827852; Mon, 20 Mar
 2023 05:20:27 -0700 (PDT)
MIME-Version: 1.0
From: Anurag Aggarwal <anurag19aggarwal@gmail.com>
Date: Mon, 20 Mar 2023 17:50:16 +0530
Message-ID: <CAPoNrtsy+ckCHQZGYM-8DW3S3FckABGyZtvVG3LJPDT8PLzMUQ@mail.gmail.com>
Subject: Help with setting up Auditd kernel repository
To: Linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello All,

Will anyone help me with some documentation on how to build and test
auditd-kernel repository?

-- 
Anurag Aggarwal

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

