Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A48867ECBA
	for <lists+linux-audit@lfdr.de>; Fri, 27 Jan 2023 18:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674841719;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WFEJ2aWBbrzMjl1MMFmyl0hXs3WhgmbVvqJI+x+wbTA=;
	b=cGbhjJ2jjvEkfF1bFrED+eerCtyL/FqRmuRSBhW3+2tgHZyK9E95XjBShMdsBXUq0jkaX9
	udHahBwuZiRxanDSTV1Nd9Sh0DgeGKPeIQbncF5yHo/bHDCCl4BVp81LdnyYpKW91e1H9+
	3yS2lonbplgsKHdC+6XsuJrvOKYjhAk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-j3O8VjRJPjCnnQqpX9swtA-1; Fri, 27 Jan 2023 12:48:38 -0500
X-MC-Unique: j3O8VjRJPjCnnQqpX9swtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5C8E2A59562;
	Fri, 27 Jan 2023 17:48:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B0BF14171BE;
	Fri, 27 Jan 2023 17:48:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4247319465A3;
	Fri, 27 Jan 2023 17:48:18 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 28C4E194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 17:40:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E980C2026D4B; Fri, 27 Jan 2023 17:40:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEC032026D2B
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 17:40:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B54993813F43
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 17:40:08 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-Y-VzjCSWNSOJwTHt7cKzjw-1; Fri, 27 Jan 2023 12:40:05 -0500
X-MC-Unique: Y-VzjCSWNSOJwTHt7cKzjw-1
Received: by mail-il1-f179.google.com with SMTP id i1so2571953ilu.8
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 09:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nMdaWi0s/rkZk6dpLDDLpOfnmZySxuJZ3EtfBdn16L4=;
 b=gJozp+ilyFs2hqDrzGmjyeO5RVRXdqiwecIy7OeQrFP1q9/D0kuJ768IvAfbWpEPSS
 4HiilpOxhvY1gyIEu2aC9iDTwLa7lM96NXeuTZHeXbzRQ+UDQlh/hdp3nU2OpPHXCwWG
 zmss+IdXQnzykbV8EKc5Ms/N4V5H1yN0G5Q1U3MyKH8X701sDyG3faJ6Sl7Y2VjOK+Y8
 VUUubUY6yxRR1zyPS9rugLyTPJW8w5bdFSzBaMV92Ef4Rc4RgmHrWSebzr1ehx6gZMhp
 LtOUjvcB+hvcBn7u1kTmggIZHy/ToMlxDR0ygL4On07YZOOGSW48IX/0r9ed0R4zWQd/
 l06Q==
X-Gm-Message-State: AFqh2kpQMJuYro+NgVlZuV+XMZvgqx52E2EtGmoaeJBDLWPixubAb/PC
 n/LMcIZNoxrIs28F2xBOq6vlQw==
X-Google-Smtp-Source: AMrXdXv9DihVENlcQq0pOotAPOzVVKESgzXFyP8XLUMwU5cLPg43k/1mKykmI89PI8spm0omdIPZ5A==
X-Received: by 2002:a92:d3c2:0:b0:30f:4feb:50c7 with SMTP id
 c2-20020a92d3c2000000b0030f4feb50c7mr3682315ilh.3.1674841204444; 
 Fri, 27 Jan 2023 09:40:04 -0800 (PST)
Received: from [192.168.1.94] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 h13-20020a0566380f0d00b0039e2e4c82c8sm1138314jas.123.2023.01.27.09.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 09:40:03 -0800 (PST)
Message-ID: <da695bf4-bd9b-a03d-3fbc-686724a7b602@kernel.dk>
Date: Fri, 27 Jan 2023 10:40:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 0/2] two suggested iouring op audit updates
To: Richard Guy Briggs <rgb@redhat.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, io-uring@vger.kernel.org
References: <cover.1674682056.git.rgb@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <cover.1674682056.git.rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Fri, 27 Jan 2023 17:48:17 +0000
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
Cc: Christian Brauner <brauner@kernel.org>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, Pavel Begunkov <asml.silence@gmail.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMS8yNy8yMyAxMDoyM+KAr0FNLCBSaWNoYXJkIEd1eSBCcmlnZ3Mgd3JvdGU6Cj4gQSBjb3Vw
bGUgb2YgdXBkYXRlcyB0byB0aGUgaW91cmluZyBvcHMgYXVkaXQgYnlwYXNzIHNlbGVjdGlvbnMg
c3VnZ2VzdGVkIGluCj4gY29uc3VsdGF0aW9uIHdpdGggU3RldmUgR3J1YmIuCj4gCj4gUmljaGFy
ZCBHdXkgQnJpZ2dzICgyKToKPiAgIGlvX3VyaW5nLGF1ZGl0OiBhdWRpdCBJT1JJTkdfT1BfRkFE
VklTRSBidXQgbm90IElPUklOR19PUF9NQURWSVNFCj4gICBpb191cmluZyxhdWRpdDogZG8gbm90
IGxvZyBJT1JJTkdfT1BfKkdFVFhBVFRSCj4gCj4gIGlvX3VyaW5nL29wZGVmLmMgfCA0ICsrKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKTG9vayBm
aW5lIHRvIG1lIC0gd2Ugc2hvdWxkIHByb2JhYmx5IGFkZCBzdGFibGUgdG8gYm90aCBvZiB0aGVt
LCBqdXN0CnRvIGtlZXAgdGhpbmdzIGNvbnNpc3RlbnQgYWNyb3NzIHJlbGVhc2VzLiBJIGNhbiBx
dWV1ZSB0aGVtIHVwIGZvciA2LjMuCgotLSAKSmVucyBBeGJvZQoKCi0tCkxpbnV4LWF1ZGl0IG1h
aWxpbmcgbGlzdApMaW51eC1hdWRpdEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtYXVkaXQK

